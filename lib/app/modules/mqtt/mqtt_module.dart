import 'mqtt_routes.dart';
import 'pages/home/home_controller.dart';
import 'pages/login/login_controller.dart';
import 'mqtt_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MqttModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => LoginController(i.get())),
        Bind((i) => MqttController()),
      ];

  @override
  List<ModularRouter> get routers => routes;

  static Inject get to => Inject<MqttModule>.of();
}
