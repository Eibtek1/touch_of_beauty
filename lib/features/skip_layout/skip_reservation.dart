import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_router/screens_name.dart';
import '../../core/app_theme/light_theme.dart';
import '../../core/assets_path/font_path.dart';

class SkipReservation extends StatelessWidget {
  const SkipReservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الحجوزات',style: TextStyle(color: Colors.black,fontSize: 16.sp,fontFamily: FontPath.poppinsRegular),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: InkWell(
          onTap: (){
            Navigator.pushNamedAndRemoveUntil(context, ScreenName.loginScreen, (route) => false);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('يجب تسجيل الدخول لحجز الخدمات',style: TextStyle(color: Colors.black,fontSize: 16.sp,fontFamily: FontPath.poppinsRegular),),
              SizedBox(width: 10.w,),
              Text(' الأن',style: TextStyle(color: AppColorsLightTheme.secondaryColor,fontSize: 18.sp,fontFamily: FontPath.poppinsRegular),),
            ],
          ),
        ),
      ),
    );
  }
}
