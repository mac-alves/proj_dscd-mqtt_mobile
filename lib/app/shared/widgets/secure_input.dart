import 'package:flutter/material.dart';
import 'package:mobile/app/shared/utils/constants.dart';
import 'package:mobile/app/shared/utils/sizes.dart';

class SecureInput extends StatefulWidget {

  final String label;
  final void Function(String) change;
  final String placeholder;
  final String msgError;
  final String value;

  const SecureInput({
    Key key, 
    @required this.label, 
    @required this.change, 
    @required this.placeholder,
    @required this.msgError, 
    this.value,
  }) : super(key: key);

  @override
  _SecureInputState createState() => _SecureInputState();
}

class _SecureInputState extends State<SecureInput> {

  bool secure = true;
  bool error = false;

  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text = widget.value;
  }

  @override
  void dispose() {
    super.dispose();
    
    if (controller.dispose != null){
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.defaultPadding / 2,
        left: SizeConfig.defaultPadding,
        right: SizeConfig.defaultPadding,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: 3
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                color: themeColors.textSecondary
              ),
            ),
          ),
          Container(
            height: 56,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: themeColors.tertiary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: themeColors.textSecondary
              )
            ),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              obscureText: secure,
              onChanged: widget.change,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: themeColors.textSecondary,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: SizeConfig.defaultPadding,
                  top: SizeConfig.defaultPadding - 3,
                ),
                suffixIcon: FlatButton(
                  minWidth: 30,
                  child: Icon(
                    !secure ? Icons.visibility : Icons.visibility_off,
                    color: themeColors.textSecondary,
                  ), 
                  onPressed: () {
                    setState((){
                      secure = !secure;
                    });
                  }
                ),
              ),
              style: TextStyle(
                fontSize: 15,
                color: themeColors.textPrimary,
              ),
              validator: (value) {
                setState(() {
                  if (value.isEmpty) {
                    error = true;
                  } else {
                    error = false;
                  }
                });

                return value.isEmpty ? '' : null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 5,
            ),
            alignment: Alignment.centerLeft,
            child: !error ? null : Text(
              widget.msgError,
              style: TextStyle(
                fontSize: 12,
                color: Colors.red[600]
              ),
            ),
          ),
        ],
      ),
    );
  }
}