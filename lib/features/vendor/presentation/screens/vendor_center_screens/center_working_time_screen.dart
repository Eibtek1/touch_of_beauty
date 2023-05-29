import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/features/vendor/presentation/widgets/screen_layout_widget_with_logo.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../buisness_logic/work_hours_cubit/work_hours_cubit.dart';
import '../../../buisness_logic/work_hours_cubit/work_hours_state.dart';
import '../../widgets/add_or_update_working_hours_dialog.dart';
import '../../widgets/center_details/time_container_widget.dart';
import '../../widgets/delete_work_time.dart';

class CenterWorkingTimeScreen extends StatelessWidget {
  const CenterWorkingTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorsLightTheme.primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text(
          LocaleKeys.edit_center_details.tr(),
          style: TextStyle(
            fontSize: 17.sp,
            fontFamily: FontPath.almaraiBold,
            color: Colors.white,
          ),
        ),
      ),
      body: BackgroundScreenWithLogoWidget(
        firstContainerBackgroundHeight: 83.h,
        child: Column(
          children: [
            SizedBox(
              height: 140.h,
            ),
            Center(
              child: Text(
                LocaleKeys.long_press_delete_time.tr(),
                style: TextStyle(
                    color: const Color(0xff3C475C),
                    fontSize: 14.sp,
                    fontFamily: FontPath.almaraiRegular),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                LocaleKeys.shouldUpdateWorkHours.tr(),
                style: TextStyle(
                    color: const Color(0xff3C475C),
                    fontSize: 14.sp,
                    fontFamily: FontPath.almaraiRegular),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocConsumer<WorkHoursCubit, WorkHoursState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = WorkHoursCubit.get(context);
                return cubit.workOursList.isNotEmpty
                    ? Expanded(
                        child: state is! WorkHoursLoading
                            ? ListView.builder(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 16.w),
                                itemBuilder: (BuildContext context, int index) {
                                  print(cubit.workOursList[index].moreData);
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: TimeContainerWidget(
                                          workHoursModel:
                                              cubit.workOursList[index],
                                          isThereWorkingTime: true,
                                          onLongPress: () {
                                            if (cubit.workOursList.any(
                                                (element) =>
                                                    element.day == 0)) {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    DeleteWorkTimeDialog(
                                                  id: cubit.workOursList
                                                      .firstWhere((element) =>
                                                          element.day == 0)
                                                      .id!,
                                                ),
                                              );
                                            } else {
                                              Fluttertoast.showToast(
                                                msg: LocaleKeys
                                                    .no_time_to_delete
                                                    .tr(),
                                                gravity: ToastGravity.CENTER,
                                                backgroundColor: Colors.red,
                                              );
                                            }
                                          },
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  AddOrUpdateWorkingHoursDialog(
                                                workHoursModel:
                                                    cubit.workOursList[index],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      if (index ==
                                          cubit.workOursList.length - 1)
                                        TimeContainerWidget(
                                            workHoursModel: null,
                                            isThereWorkingTime: false,
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    const AddOrUpdateWorkingHoursDialog(
                                                  workHoursModel: null,
                                                ),
                                              );
                                            }),
                                    ],
                                  );
                                },
                                itemCount: cubit.workOursList.length,
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                      )
                    : Center(
                        child: TimeContainerWidget(
                            workHoursModel: null,
                            isThereWorkingTime: false,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    const AddOrUpdateWorkingHoursDialog(
                                  workHoursModel: null,
                                ),
                              );
                            }),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
