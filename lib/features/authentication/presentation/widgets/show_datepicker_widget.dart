import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../core/assets_path/font_path.dart';

class ShowSatePickerWidget extends StatelessWidget {
  final double height;
  final TextEditingController title;
  final Function onTap;
  const ShowSatePickerWidget({Key? key, required this.height, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColorsLightTheme.authTextFieldFillColor,
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  enabled: false,
                  controller: title,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'تاريخ الميلاد',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontFamily: FontPath.poppinsBold)
                  ),
                ),
              ),
              const Icon(Icons.calendar_month_sharp,color: Colors.grey,)
            ],
          ),
        ),
      ),
    );
  }
}
