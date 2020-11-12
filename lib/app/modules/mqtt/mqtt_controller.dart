import 'package:mobile/app/modules/mqtt/utils/comands_lamp.dart';
import 'package:mobile/app/modules/mqtt/utils/enums.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

part 'mqtt_controller.g.dart';

@Injectable()
class MqttController = _MqttControllerBase with _$MqttController;

abstract class _MqttControllerBase with Store {
 
  String host = '192.168.100.101';

  final String clientId = 'mqtt_mobile';
  final String topicJoker = 'mqtt_proj';
  final String topicConnection = 'mqtt_proj/connected';

  MqttServerClient client;

  _MqttControllerBase();

  @observable
  ConnectionStatus connectionStatus;

  @action
  setConnectionStatus(ConnectionStatus value) => connectionStatus = value;

  @observable
  StatusLamp statusLamp;

  @action
  setStatusLamp(StatusLamp value) => statusLamp = value;

  @observable
  String message;

  @action
  setMessage(String value) => message = value;
  
  configureStatusLamp(String msg){
    if (comandsReceived[msg] != null) {
      setStatusLamp(comandsReceived[msg]);
    }
  }

  @action
  Future<int> connect(String user, String password) async {

    client = MqttServerClient(host, '');

    client.logging(on: false);
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;

    final connMess = MqttConnectMessage()
        .authenticateAs(user, password)
        .withClientIdentifier(clientId)
        .keepAliveFor(20)
        .withWillTopic(topicConnection)
        .withWillMessage('$clientId-0')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('MQTT::Mosquitto client conectando....');
    
    client.connectionMessage = connMess;
    setConnectionStatus(ConnectionStatus.LOADING);

    try {
      await client.connect();
    } catch (e) {
      print('MQTT::$e');
      if (e.toString().contains('notAuthorized')) {
        setMessage('Usuário/Senha incorretos.');
      }
      client.disconnect();
      return 0;
    }

    /// Verifica se está conectado
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      setConnectionStatus(ConnectionStatus.CONECTED);
      
      client.subscribe('$topicJoker/$clientId/#', MqttQos.exactlyOnce);
      sendStatus(1);
    } else {
      print('MQTT::Erro na conexão, status: ${client.connectionStatus}');
      setConnectionStatus(ConnectionStatus.DESCONECT);
      client.disconnect();
      return 0;
    }

    /// monitora as mensagens recebidas
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload;
      final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print('MQTT::Topico:: <${c[0].topic}>, Menssage:: <-- $pt -->');
      configureStatusLamp(pt);
    });

    /// verifica todas as mensagens recebidas a partir do topico coringa
    client.published.listen((MqttPublishMessage message) {
      print('MQTT::Topico: ${message.variableHeader.topicName}, with Qos ${message.header.qos}');
    });
    
    return 0;
  }

  @action
  void disconnect() {
    sendStatus(0);
    setConnectionStatus(ConnectionStatus.DESCONECT);
    setMessage(null);
    client.disconnect();
  }

  /// envia o status de conexão com o broker
  void sendComandLamp(StatusLamp comand){
    final builder = MqttClientPayloadBuilder();
    builder.addString(comandsSent[comand]);
    client.publishMessage('$topicJoker/$clientId', MqttQos.atMostOnce, builder.payload);
    setStatusLamp(comand);
  }

  /// envia o status de conexão com o broker
  void sendStatus(int status){
    final builder = MqttClientPayloadBuilder();
    builder.addString('$clientId-$status');
    client.publishMessage(topicConnection, MqttQos.atMostOnce, builder.payload);
  }

  /// conexão bem sucedida
  void onConnected() {
    print('MQTT::Conectado.');
  }

  /// Cliente desconectado
  void onDisconnected() {
    print('MQTT::Desconectado.');

    if (client.connectionStatus.disconnectionOrigin == MqttDisconnectionOrigin.solicited) {
      print('MQTT::Retorno de desconexão solicitado.');
    }
  }

  // Inscrição bem sucedida
  void onSubscribed(String topic) {
    print('MQTT::Inscrito no topico: $topic');
  }

  // Falha na inscrição do topico
  void onSubscribeFail(String topic) {
    print('MQTT::Falha ao se inscrever em: $topic');
  }

  // Desinscrição bem sucedida
  void onUnsubscribed(String topic) {
    print('MQTT::Desinscrição no topic:o $topic');
  }

  // PING response received
  void pong() {
    print('MQTT::Ping de resposta invocado.');
  }
}
