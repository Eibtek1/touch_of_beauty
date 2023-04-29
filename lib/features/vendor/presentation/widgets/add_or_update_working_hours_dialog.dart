import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';
import 'package:touch_of_beauty/features/freelancer/presentation/widgets/custom_vendor_button.dart';

import '../../../../core/assets_path/font_path.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../buisness_logic/work_hours_cubit/work_hours_cubit.dart';
import '../../buisness_logic/work_hours_cubit/work_hours_state.dart';

class AddOrUpdateWorkingHoursDialog extends StatelessWidget {
  final int? id;
  final int day;

  const AddOrUpdateWorkingHoursDialog({Key? key, this.id, required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkHoursCubit, WorkHoursState>(
      listener: (context, state) {
        var cubit = WorkHoursCubit.get(context);
        if (state is AddWorkHoursSuccess) {
          Navigator.pop(context);
          cubit.from = null;
          cubit.to = null;
          cubit.getWorkHours();
        } else if (state is UpdateWorkHoursSuccess) {
          Navigator.pop(context);
          cubit.from = null;
          cubit.to = null;
          cubit.getWorkHours();
        }
      },
      builder: (context, state) {
        var cubit = WorkHoursCubit.get(context);
        return Dialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
          child: SizedBox(
            height: 250.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
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
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10.w,
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
                        InkWell(
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime:
                                        const TimeOfDay(hour: 12, minute: 00))
                                .then((value) {
                              cubit.from = DateTime.now();
                              cubit.from = DateTime(
                                  cubit.from!.year,
                                  cubit.from!.month,
                                  cubit.from!.day,
                                  value!.hour,
                                  value.minute);
                              cubit.changeDate();
                            }).catchError((error) {
                              return;
                            });
                          },
                          child: Container(
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
                                  cubit.from == null
                                      ? ""
                                      : Jiffy(cubit.from.toString()).Hm,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: const Color(0xff3C475C),
                                      fontFamily: FontPath.almaraiRegular,
                                      fontSize: 12.sp),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 10.w,
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
                        InkWell(
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime:
                                        const TimeOfDay(hour: 12, minute: 00))
                                .then((value) {
                              cubit.to = DateTime.now();
                              cubit.to = DateTime(
                                  cubit.to!.year,
                                  cubit.to!.month,
                                  cubit.to!.day,
                                  value!.hour,
                                  value.minute);
                              cubit.changeDate();
                            }).catchError((error) {
                              return;
                            });
                          },
                          child: Container(
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
                                cubit.to == null
                                    ? ""
                                    : Jiffy(cubit.to.toString()).Hm,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0xff3C475C),
                                    fontFamily: FontPath.almaraiRegular,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                  !cubit.isUpdateOrAdd
                      ? CustomVendorButton(
                          buttonTitle: LocaleKeys.add.tr(),
                          isTapped: () {
                            if (cubit.from == null || cubit.to == null) {
                              Fluttertoast.showToast(
                                  msg: LocaleKeys.please_select_time.tr(),
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.red);
                            } else if (id != null) {
                              cubit.updateWorkHours(day: day, id: id!);
                            } else {
                              cubit.addWorkHours(day: day);
                            }
                          },
                          width: 200.w,
                          paddingVertical: 10.h,
                          paddingHorizontal: 10.w,
                        )
                      : const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
