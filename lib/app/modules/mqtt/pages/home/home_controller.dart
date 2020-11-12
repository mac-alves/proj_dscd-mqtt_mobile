import 'package:mobile/app/modules/mqtt/mqtt_controller.dart';
import 'package:mobile/app/modules/mqtt/utils/enums.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  MqttController mqtt;

  _HomeControllerBase(this.mqtt);

  void sendStatus(){
    mqtt.sendComandLamp(
      mqtt.statusLamp == StatusLamp.ON 
        ? StatusLamp.OFF 
        : StatusLamp.ON
    );
  }
}
