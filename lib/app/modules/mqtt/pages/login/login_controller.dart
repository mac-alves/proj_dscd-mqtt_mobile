import 'package:flutter/material.dart';
import 'package:mobile/app/modules/mqtt/mqtt_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  
  MqttController mqtt;

  _LoginControllerBase(this.mqtt);

  final formKey = GlobalKey<FormState>();

  @observable
  String user;

  @observable
  String password;

  @observable
  String message;

  @action
  setUser(String value) => user = value;

  @action
  setPassword(String value) => password = value;

  @action
  setMessage(String value) => message = value;

  bool validateFields(){
    return formKey.currentState.validate();
  }

  @action
  Future connect() async {
    await mqtt.connect(user, password);
  }
}
