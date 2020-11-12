import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/modules/mqtt/mqtt_routes.dart';
import 'package:mobile/app/modules/mqtt/utils/enums.dart';
import 'package:mobile/app/shared/utils/constants.dart';
import 'package:mobile/app/shared/utils/sizes.dart';
import 'package:mobile/app/shared/widgets/input_text.dart';
import 'package:mobile/app/shared/widgets/secure_input.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: themeColors.primary,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: controller.formKey,
                child: Observer(
                  builder: (_){
                    return Column(
                      children: [
                        InputText(
                          label: 'Usuário',
                          placeholder: 'Nome do usuário',
                          change: (value){
                            controller.setUser(value);
                          },
                          msgError: 'Nome inválido',
                          value: controller.user
                        ),
                        SecureInput(
                          label: 'Senha',
                          placeholder: 'Senha do usuário',
                          change: (value){
                            controller.setPassword(value);
                          },
                          msgError: 'Senha inválida',
                          value: controller.password
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: SizeConfig.defaultPadding,
                            left: SizeConfig.defaultPadding,
                            right: SizeConfig.defaultPadding
                          ),
                          child: RaisedButton(
                            color: themeColors.sistemColor,
                            onPressed: () async {
                              if (controller.validateFields()) {
                                await controller.connect();

                                if (controller.mqtt.connectionStatus == ConnectionStatus.CONECTED) {
                                  Modular.to.pushReplacementNamed(MQTT_HOME);
                                } else {
                                  print('Erro ao conectar');
                                }
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Container(
                              height: 56,
                              child: Center(
                                child: Text(
                                  'Conectar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: themeColors.textPrimary
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Observer(
                            builder: (_){
                              return Text(
                                controller.mqtt.message == null ? '' : controller.mqtt.message,
                                style: TextStyle(
                                  color: themeColors.textPrimary
                                ),
                              );
                            }
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
