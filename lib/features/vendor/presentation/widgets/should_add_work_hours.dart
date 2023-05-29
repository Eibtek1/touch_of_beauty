import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';

import '../../../../core/assets_path/font_path.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../freelancer/presentation/widgets/custom_vendor_button.dart';

class ShouldAddWorkHoursDialog extends StatelessWidget {
  final int isCenterOrFreelancer;
  const ShouldAddWorkHoursDialog({Key? key, required this.isCenterOrFreelancer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      child: SizedBox(
        height: 175.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.youShouldAddWorkHours.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff3C475C),
                    fontSize: 14.sp,
                    fontFamily: FontPath.almaraiBold),
              ),
              SizedBox(height: 10.h,),
              CustomVendorButton(
                buttonTitle: LocaleKeys.goToAdd.tr(),
                isTapped: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, isCenterOrFreelancer==0?ScreenName.centerWorkingTimeScreen:ScreenName.freelancerTimeScreen);
                },
                width: 200.w,
                paddingVertical: 10.h,
                paddingHorizontal: 10.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
