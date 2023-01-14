import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/assets_path/font_path.dart';
import 'onboarding_class.dart';

class ImagesWidget extends StatelessWidget {
  final OnboardingModel model;
  const ImagesWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(model.backGround,fit: BoxFit.cover,),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.title,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontFamily: FontPath.almaraiBold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                model.bodyTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                    height: 1.5.h,
                    fontFamily: FontPath.almaraiLight),
              ),
            ],
          ),
        )
      ],
    );
  }
}
