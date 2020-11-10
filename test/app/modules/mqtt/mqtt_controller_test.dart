import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile/app/modules/mqtt/mqtt_controller.dart';
import 'package:mobile/app/modules/mqtt/mqtt_module.dart';

void main() {
  initModule(MqttModule());
  // MqttController mqtt;
  //
  setUp(() {
    //     mqtt = MqttModule.to.get<MqttController>();
  });

  group('MqttController Test', () {
    //   test("First Test", () {
    //     expect(mqtt, isInstanceOf<MqttController>());
    //   });

    //   test("Set Value", () {
    //     expect(mqtt.value, equals(0));
    //     mqtt.increment();
    //     expect(mqtt.value, equals(1));
    //   });
  });
}
