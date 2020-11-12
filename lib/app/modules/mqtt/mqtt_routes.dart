
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/modules/mqtt/pages/home/home_page.dart';
import 'package:mobile/app/modules/mqtt/pages/login/login_page.dart';

const String MQTT_LOGIN = Modular.initialRoute;
const String MQTT_HOME = '/home';

var routes = [
  ModularRouter(MQTT_LOGIN, child: (_, args) => LoginPage()),
  ModularRouter(MQTT_HOME, child: (_, args) => HomePage()),
];