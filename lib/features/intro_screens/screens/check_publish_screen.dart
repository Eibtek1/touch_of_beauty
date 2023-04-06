import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/cache_manager/cache_keys.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/core/network/api_end_points.dart';
import 'package:touch_of_beauty/core/network/dio_helper.dart';
import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';

import '../../../core/app_theme/light_theme.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/cache_manager/shared_preferences.dart';

class CheckPublishScreen extends StatefulWidget {
  const CheckPublishScreen({Key? key}) : super(key: key);

  @override
  State<CheckPublishScreen> createState() => _CheckPublishScreenState();
}

class _CheckPublishScreenState extends State<CheckPublishScreen> {
  MainResponse? _mainResponse;
  bool? _isPublish;

@override
  void initState() {
  _checkPublish();
    super.initState();
  }
  void _checkPublish() async {
    final response = await DioHelper.getData(url: EndPoints.applePublish);
    _mainResponse = MainResponse.fromJson(response.data);
    _isPublish = _mainResponse!.data['isLive'];
    checkPublish = await CacheHelper.saveData(key: CacheKeys.checkPublish, value: _isPublish);
    if(mounted){
      Navigator.pushNamedAndRemoveUntil(context, ScreenName.onboardingScreen, (route) => false);
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLightTheme.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: "logo",
              child: Image.asset(
                ImagePath.splashLogoImage,
                height: 227.h,
                width: 320.w,
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Center(
            child: SizedBox(
              width: 200.w,
              height: 5.h,
              child: const LinearProgressIndicator(color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
