import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'mqtt_controller.dart';

class MqttPage extends StatefulWidget {
  final String title;
  const MqttPage({Key key, this.title = "Mqtt"}) : super(key: key);

  @override
  _MqttPageState createState() => _MqttPageState();
}

class _MqttPageState extends ModularState<MqttPage, MqttController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
