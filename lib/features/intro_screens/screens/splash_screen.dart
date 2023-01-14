import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _loading();
    super.initState();
  }
   _loading(){
    Timer(const Duration(seconds: 2), () { Navigator.pushReplacementNamed(context, ScreenName.onboardingScreen);});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLightTheme.primaryColor,
      body: Center(
        child: Image.asset(ImagePath.splashLogoImage,height: 227.h,width: 320.w,),
      ),
    );
  }
}
