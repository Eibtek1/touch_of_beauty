import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import '../../../core/cache_manager/cache_keys.dart';
import '../../../core/cache_manager/shared_preferences.dart';

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

  _loading() async{
    bool? onboarding = CacheHelper.getData(key: CacheKeys.onboarding);
    token = CacheHelper.getData(key: CacheKeys.token);
    userType = CacheHelper.getData(key: CacheKeys.userType);

    Timer(
      const Duration(seconds: 2),
      () {
        if (onboarding == null) {
          Navigator.pushReplacementNamed(context, ScreenName.onboardingScreen);
        } else if (token != null&&userType != null) {
          if(userType == 1.toString()){
            Navigator.pushReplacementNamed(
                context, ScreenName.userMainLayout);
          }else if (userType == 2.toString()) {
            Navigator.pushReplacementNamed(
                context, ScreenName.vendorMainLayout);
          } else if (userType == 3.toString()) {
            Navigator.pushReplacementNamed(
                context, ScreenName.freelancerMainLayout);
          }
        } else {
          Navigator.pushReplacementNamed(context, ScreenName.loginScreen);
        }
      },
    );
  }

  void loadingUserData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLightTheme.primaryColor,
      body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Center(
                    child: Image.asset(
                      ImagePath.splashLogoImage,
                      height: 227.h,
                      width: 320.w,
                    ),
                  ),
                ]),
    );
  }
}
