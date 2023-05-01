import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../translations/locale_keys.g.dart';
import 'auht_text_form_field.dart';

class PasswordAuthField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? confirmController;
  final bool isConfirmPassword;
  final String hintText;
  const PasswordAuthField({Key? key, required this.controller, this.confirmController, this.isConfirmPassword = false, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      hintText: hintText,
      controller: controller,
      isPassword: true,
      validate: (value) {
        if(isConfirmPassword){
          if (controller.text != confirmController!.text) {
            return LocaleKeys.password_is_different.tr();
          }
        }else{
          if (value!.isEmpty) {
            return LocaleKeys.enter_password.tr();
          } else if (value.length < 6) {
            return LocaleKeys.weak_password.tr();
          }
        }
        return null;
      },
    );
  }
}
