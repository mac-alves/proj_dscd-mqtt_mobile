import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'mqtt_controller.g.dart';

@Injectable()
class MqttController = _MqttControllerBase with _$MqttController;

abstract class _MqttControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
