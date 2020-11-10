import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile/app/modules/mqtt/pages/home/home_controller.dart';
import 'package:mobile/app/modules/mqtt/mqtt_module.dart';

void main() {
  initModule(MqttModule());
  // HomeController home;
  //
  setUp(() {
    //     home = MqttModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
    //   test("First Test", () {
    //     expect(home, isInstanceOf<HomeController>());
    //   });

    //   test("Set Value", () {
    //     expect(home.value, equals(0));
    //     home.increment();
    //     expect(home.value, equals(1));
    //   });
  });
}
