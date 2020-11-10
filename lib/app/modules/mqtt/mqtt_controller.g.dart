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
  final _$valueAtom = Atom(name: '_MqttControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_MqttControllerBaseActionController =
      ActionController(name: '_MqttControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MqttControllerBaseActionController.startAction(
        name: '_MqttControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MqttControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
