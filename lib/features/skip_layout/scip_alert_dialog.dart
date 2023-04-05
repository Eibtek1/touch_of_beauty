import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_router/screens_name.dart';
import '../../core/app_theme/light_theme.dart';
import '../../core/assets_path/font_path.dart';
import '../freelancer/presentation/widgets/custom_vendor_button.dart';

class SkipAlertDialog extends StatelessWidget {
  final String title;
  const SkipAlertDialog({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 150.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(title,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontFamily: FontPath.poppinsRegular),),
            ),
            SizedBox(height: 30.h,),
            CustomVendorButton(
                buttonTitle: 'نسجيل الدخول',
                isTapped: () {
                  Navigator.pushNamedAndRemoveUntil(context, ScreenName.loginScreen, (route) => false);
                },
                width: double.infinity,
                paddingVertical: 12.h,
                paddingHorizontal: 45.w)
          ],
        ),
      ),
    );
  }
}
