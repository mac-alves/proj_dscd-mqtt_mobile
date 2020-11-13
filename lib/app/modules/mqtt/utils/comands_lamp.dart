import 'enums.dart';

Map<String, StatusLamp> comandsReceived = {
  'lp-1': StatusLamp.ON,
  'lp-0': StatusLamp.OFF,
};

Map<StatusLamp, String> comandsSent = {
  StatusLamp.ON: 'lp-1',
  StatusLamp.OFF: 'lp-0',
};