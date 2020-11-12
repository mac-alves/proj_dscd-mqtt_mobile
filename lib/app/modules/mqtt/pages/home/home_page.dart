import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/modules/mqtt/mqtt_routes.dart';
import 'package:mobile/app/modules/mqtt/utils/enums.dart';
import 'package:mobile/app/shared/utils/constants.dart';
import 'package:mobile/app/shared/utils/sizes.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: themeColors.primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.white,
            ), 
            onPressed: (){
              controller.mqtt.disconnect();
              Modular.to.pushReplacementNamed(MQTT_LOGIN);
            }
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  controller.sendStatus();
                }, 
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: themeColors.tertiary,
                    borderRadius: BorderRadius.circular(120),
                  ),
                  child: Observer(
                    builder: (_){
                      return Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: themeColors.secondary,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                          color: controller.mqtt.statusLamp == StatusLamp.ON 
                            ? Color(0xFF01A862)
                            : Color(0xFFFD3154)
                        )
                        ),
                        child: Icon(
                          Icons.wb_sunny,
                          size: 130,
                          color: controller.mqtt.statusLamp == StatusLamp.ON 
                            ? Color(0xFF01A862)
                            : Color(0xFFFD3154)
                        ),
                      );
                    }
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
