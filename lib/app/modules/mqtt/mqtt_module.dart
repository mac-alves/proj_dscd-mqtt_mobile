import 'pages/home/home_controller.dart';
import 'pages/login/login_controller.dart';
import 'mqtt_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'mqtt_page.dart';

class MqttModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
        $LoginController,
        $MqttController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => MqttPage()),
      ];

  static Inject get to => Inject<MqttModule>.of();
}
