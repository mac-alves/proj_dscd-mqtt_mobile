import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final formKey = GlobalKey<FormState>();

  String host = '192.168.100.101';

  @observable
  String user;

  @observable
  String password;

  @observable
  String topic;

  @observable
  String message;

  @action
  setUser(String value) => user = value;

  @action
  setPassword(String value) => password = value;

  @action
  setTopic(String value) => topic = value;

  @action
  setMessage(String value) => message = value;

  bool validateFields(){
    return formKey.currentState.validate();
  }

  MqttServerClient client;

  _HomeControllerBase();
  
  @action
  Future<int> conect() async {

    client = MqttServerClient(host, '');

    client.logging(on: false);
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    final connMess = MqttConnectMessage()
        .authenticateAs(user, password)
        .withClientIdentifier('mqtt_mobile')
        .keepAliveFor(20) // Must agree with the keep alive set above or not set
        .withWillTopic('willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('MQTT::Mosquitto client conectando....');
    
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      // Raised by the client when connection fails.
      print('MQTT::client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      // Raised by the socket layer
      print('MQTT::socket exception - $e');
      client.disconnect();
    } catch (e) {
      // qualquer outro erro gerado
      print('MQTT::exception $e');
      client.disconnect();
    }

    /// Verifica se está conectado
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      print('MQTT::Mosquitto client conectado');
      setMessage('Conectado ao Mosquito');
    } else {
      print('MQTT::Erro na conexão, status: ${client.connectionStatus}');
      setMessage('Erro na conexão, status: ${client.connectionStatus}');
      client.disconnect();
      exit(-1);
    }

    /// Caso esteja conectado tenta uma assinatura
    print('MQTT::Subscribing no topico test/lol');
    // const topic = 'test/lol'; // Not a wildcard topic
    client.subscribe(topic, MqttQos.atMostOnce);

    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print(
          'MQTT::Change notification:: Topico: <${c[0].topic}>, Menssage: <-- $pt -->');
      print('');
      setMessage('Message: $pt');
    });

    client.published.listen((MqttPublishMessage message) {
      print(
          'MQTT::Published notification:: Topico: ${message.variableHeader.topicName}, with Qos ${message.header.qos}');
      setMessage('Publucado em: ${message.variableHeader.topicName} Qos: ${message.header.qos}');
    });

    // const pubTopic = 'Dart/Mqtt_client/testtopic';
    // final builder = MqttClientPayloadBuilder();
    // builder.addString('Hello from mqtt_client');

    /// Subscribe to it
    // print('MQTT::Subscribing to the Dart/Mqtt_client/testtopic topic');
    // client.subscribe(pubTopic, MqttQos.exactlyOnce);

    /// Publish it
    // print('MQTT::Publishing our topic');
    // client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload);

    /// Ok, agora vamos dormir um pouco, nesta lacuna você verá solicitação / resposta de ping
    /// mensagens sendo trocadas pelo mecanismo keep alive.
    // print('MQTT::Sleeping....');
    // await MqttUtilities.asyncSleep(120);

    // Finalmente, cancele a inscrição e saia normalmente
    // print('MQTT::Unsubscribing');
    // client.unsubscribe(topic);

    /// Wait for the unsubscribe message from the broker if you wish.
    // await MqttUtilities.asyncSleep(2);
    // print('MQTT::Disconnecting');
    // client.disconnect();
    return 0;
  }

  /// O retorno de chamada inscrito
  void onSubscribed(String topic) {
    print('MQTT::Assinatura confirmada para o tópico: $topic');
  }

  /// O retorno de chamada de desconexão não solicitado
  void onDisconnected() {
    print('MQTT::Retorno de chamada do cliente OnDisconnected - Desconexão do cliente');
    if (client.connectionStatus.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      print('MQTT::O retorno de chamada OnDisconnected é solicitado, correto');
    }
    exit(-1);
  }

  /// O retorno de chamada de conexão bem-sucedido
  void onConnected() {
    print(
      'MQTT::ORetorno de chamada do cliente OnConnected - A conexão do cliente foi bem-sucedida'
    );
  }

  /// Pong retorno de chamada
  void pong() {
    print('MQTT::Chamada de retorno do cliente de resposta ao ping invocada');
  }
}
