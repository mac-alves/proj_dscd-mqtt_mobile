import 'enums.dart';

Map<String, StatusLamp> comandsReceived = {
  'nodemcu_lamp-1': StatusLamp.ON,
  'nodemcu_lamp-0': StatusLamp.OFF,
};

Map<StatusLamp, String> comandsSent = {
  StatusLamp.ON: 'nodemcu_lamp-1',
  StatusLamp.OFF: 'nodemcu_lamp-0',
};