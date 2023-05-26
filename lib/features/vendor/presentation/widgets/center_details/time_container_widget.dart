import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../buisness_logic/work_hours_cubit/work_hours_cubit.dart';
import '../../../buisness_logic/work_hours_cubit/work_hours_state.dart';
import '../../../data/models/work_hours_model.dart';

class TimeContainerWidget extends StatelessWidget {
  final bool isThereWorkingTime;
  final WorkHoursModel? workHoursModel;
  final void Function() onPressed;
  final void Function()? onLongPress;

  const TimeContainerWidget({Key? key,
    required this.workHoursModel,
    required this.isThereWorkingTime,
    required this.onPressed,
    this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        height: 85.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.14),
                offset: const Offset(0, 0),
                blurRadius: 10.r,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 5.w,
            ),
            if(workHoursModel!=null)Text(
              DateFormat('yMMMd').format(DateTime.parse(
                  workHoursModel!.moreData!)),
              style: TextStyle(
                  color: const Color(0xff3C475C),
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiRegular),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              LocaleKeys.from.tr(),
              style: TextStyle(
                  color: const Color(0xff3C475C),
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiRegular),
            ),
            SizedBox(
              width: 7.w,
            ),
            Container(
                height: 31.h,
                width: 61.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xff3C475C),
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text(
                    isThereWorkingTime
                        ? workHoursModel?.from?.substring(0, 5) ?? ""
                        : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff3C475C),
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 12.sp),
                  ),
                )),
            SizedBox(
              width: 5.w,
            ),
            Text(
              LocaleKeys.to.tr(),
              style: TextStyle(
                  color: const Color(0xff3C475C),
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiRegular),
            ),
            SizedBox(
              width: 7.w,
            ),
            Container(
                height: 31.h,
                width: 61.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xff3C475C),
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text(
                    isThereWorkingTime
                        ? workHoursModel?.to?.substring(0, 5) ?? ""
                        : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff3C475C),
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 12.sp),
                  ),
                )),
            SizedBox(
              width: 7.w,
            ),
            if(workHoursModel==null)TextButton(
              onPressed: onPressed,
              child: Text(
                isThereWorkingTime
                    ? LocaleKeys.edit.tr()
                    : LocaleKeys.add.tr(),
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: AppColorsLightTheme.secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
