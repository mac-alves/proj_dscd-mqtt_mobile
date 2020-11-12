// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MqttController = BindInject(
  (i) => MqttController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MqttController on _MqttControllerBase, Store {
  final _$connectionStatusAtom =
      Atom(name: '_MqttControllerBase.connectionStatus');

  @override
  ConnectionStatus get connectionStatus {
    _$connectionStatusAtom.reportRead();
    return super.connectionStatus;
  }

  @override
  set connectionStatus(ConnectionStatus value) {
    _$connectionStatusAtom.reportWrite(value, super.connectionStatus, () {
      super.connectionStatus = value;
    });
  }

  final _$statusLampAtom = Atom(name: '_MqttControllerBase.statusLamp');

  @override
  StatusLamp get statusLamp {
    _$statusLampAtom.reportRead();
    return super.statusLamp;
  }

  @override
  set statusLamp(StatusLamp value) {
    _$statusLampAtom.reportWrite(value, super.statusLamp, () {
      super.statusLamp = value;
    });
  }

  final _$messageAtom = Atom(name: '_MqttControllerBase.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$connectAsyncAction = AsyncAction('_MqttControllerBase.connect');

  @override
  Future<int> connect(String user, String password) {
    return _$connectAsyncAction.run(() => super.connect(user, password));
  }

  final _$_MqttControllerBaseActionController =
      ActionController(name: '_MqttControllerBase');

  @override
  dynamic setConnectionStatus(ConnectionStatus value) {
    final _$actionInfo = _$_MqttControllerBaseActionController.startAction(
        name: '_MqttControllerBase.setConnectionStatus');
    try {
      return super.setConnectionStatus(value);
    } finally {
      _$_MqttControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatusLamp(StatusLamp value) {
    final _$actionInfo = _$_MqttControllerBaseActionController.startAction(
        name: '_MqttControllerBase.setStatusLamp');
    try {
      return super.setStatusLamp(value);
    } finally {
      _$_MqttControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMessage(String value) {
    final _$actionInfo = _$_MqttControllerBaseActionController.startAction(
        name: '_MqttControllerBase.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_MqttControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disconnect() {
    final _$actionInfo = _$_MqttControllerBaseActionController.startAction(
        name: '_MqttControllerBase.disconnect');
    try {
      return super.disconnect();
    } finally {
      _$_MqttControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectionStatus: ${connectionStatus},
statusLamp: ${statusLamp},
message: ${message}
    ''';
  }
}
