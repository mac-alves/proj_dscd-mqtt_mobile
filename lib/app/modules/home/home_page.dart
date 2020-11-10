import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/shared/utils/constants.dart';
import 'package:mobile/app/shared/utils/sizes.dart';
import 'package:mobile/app/shared/widgets/input_text.dart';
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
    return Scaffold(
      backgroundColor: themeColors.primary,
      appBar: AppBar(
        backgroundColor: themeColors.secondary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
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
                    InputText(
                      label: 'Senha',
                      placeholder: 'Senha do usuário',
                      change: (value){
                        controller.setPassword(value);
                      },
                      msgError: 'Senha inválida',
                      value: controller.password
                    ),
                    InputText(
                      label: 'Tópico',
                      placeholder: 'Tópico de inscrição',
                      change: (value){
                        controller.setTopic(value);
                      },
                      msgError: 'Tópico inválido',
                      value: controller.topic
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.defaultPadding,
                        left: SizeConfig.defaultPadding,
                        right: SizeConfig.defaultPadding
                      ),
                      child: RaisedButton(
                        color: themeColors.moneyColor,
                        onPressed: () {
                          if (controller.validateFields()) {
                            print('object');
                            controller.conect();
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
                            controller.message == null ? '' : controller.message,
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
    );
  }
}
