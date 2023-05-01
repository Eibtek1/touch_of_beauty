import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets_path/svg_path.dart';
import '../../../../translations/locale_keys.g.dart';
import 'auht_text_form_field.dart';

class PhoneAuthFormField extends StatelessWidget {
  final TextEditingController controller;
  const PhoneAuthFormField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      hintText: LocaleKeys.phone_number.tr(),
      keyboardType: TextInputType.phone,
      // textDirection: TextDirection.ltr,
      validate: (value) {
        var regex = RegExp(r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$');
        if (value!.isEmpty) {
          return LocaleKeys.enter_your_phone.tr();
        }
        else if (!regex.hasMatch(value)) {
          return LocaleKeys.valid_phone_number.tr();
        }
        return null;
      },
      suffix: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: SvgPicture.asset(
          SvgPath.saudiPhoneFieldIcon,
          width: 52.w,
          height: 15.h,
        ),
      ),
      controller: controller,
    );
  }
}
