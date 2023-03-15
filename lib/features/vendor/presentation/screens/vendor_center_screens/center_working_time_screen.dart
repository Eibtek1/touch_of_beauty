import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/features/vendor/presentation/widgets/screen_layout_widget_with_logo.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
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
          'تعديل بيانات المركز',
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
            BlocConsumer<WorkHoursCubit, WorkHoursState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = WorkHoursCubit.get(context);
                return Expanded(
                  child: state is! WorkHoursLoading
                      ? ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 16.w),
                          children: [
                            Center(
                              child: Text(
                                'قم بالضغط مطولا لحذف التوقيت',
                                style: TextStyle(
                                    color: const Color(0xff3C475C),
                                    fontSize: 14.sp,
                                    fontFamily: FontPath.almaraiRegular),
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            TimeContainerWidget(
                              onLongPress: () {
                                if(cubit.workOursList
                                    .any((element) => element.day == 0)){
                                  showDialog(
                                    context: context,
                                    builder: (context) => DeleteWorkTimeDialog(
                                      id: cubit.workOursList
                                          .firstWhere(
                                              (element) => element.day == 0)
                                          .id!,
                                    ),
                                  );
                                }else{
                                  Fluttertoast.showToast(msg: 'لا يوجد توقيت للحذف',gravity: ToastGravity.CENTER,backgroundColor: Colors.red,);
                                }
                              },
                              title: 'السبت',
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      AddOrUpdateWorkingHoursDialog(
                                    day: 0,
                                    id: cubit.workOursList
                                            .any((element) => element.day == 0)
                                        ? cubit.workOursList
                                            .firstWhere(
                                                (element) => element.day == 0)
                                            .id!
                                        : null,
                                  ),
                                );
                              },
                              isThereWorkingTime: cubit.workOursList
                                  .any((element) => element.day == 0),
                              from: cubit.workOursList
                                      .any((element) => element.day == 0)
                                  ? cubit.workOursList
                                      .firstWhere((element) => element.day == 0)
                                      .from!
                                  : null,
                              to: cubit.workOursList
                                      .any((element) => element.day == 0)
                                  ? cubit.workOursList
                                      .firstWhere((element) => element.day == 0)
                                      .to!
                                  : null,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TimeContainerWidget(
                                onLongPress: () {
                                  if(cubit.workOursList
                                      .any((element) => element.day == 1)){
                                    showDialog(
                                      context: context,
                                      builder: (context) => DeleteWorkTimeDialog(
                                        id: cubit.workOursList
                                            .firstWhere(
                                                (element) => element.day == 1)
                                            .id!,
                                      ),
                                    );
                                  }else{
                                    Fluttertoast.showToast(msg: 'لا يوجد توقيت للحذف',gravity: ToastGravity.CENTER,backgroundColor: Colors.red,);
                                  }
                                },
                                title: 'الاحد',
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AddOrUpdateWorkingHoursDialog(
                                      day: 1,
                                      id: cubit.workOursList.any(
                                              (element) => element.day == 1)
                                          ? cubit.workOursList
                                              .firstWhere(
                                                  (element) => element.day == 1)
                                              .id!
                                          : null,
                                    ),
                                  );
                                },
                                isThereWorkingTime: cubit.workOursList
                                    .any((element) => element.day == 1),
                                from: cubit.workOursList
                                        .any((element) => element.day == 1)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 1)
                                        .from!
                                    : null,
                                to: cubit.workOursList
                                        .any((element) => element.day == 1)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 1)
                                        .to!
                                    : null),
                            SizedBox(
                              height: 20.h,
                            ),
                            TimeContainerWidget(
                                onLongPress: () {
                                  if(cubit.workOursList
                                      .any((element) => element.day == 2)){
                                    showDialog(
                                      context: context,
                                      builder: (context) => DeleteWorkTimeDialog(
                                        id: cubit.workOursList
                                            .firstWhere(
                                                (element) => element.day == 2)
                                            .id!,
                                      ),
                                    );
                                  }else{
                                    Fluttertoast.showToast(msg: 'لا يوجد توقيت للحذف',gravity: ToastGravity.CENTER,backgroundColor: Colors.red,);
                                  }
                                },
                                title: 'الاثنين',
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AddOrUpdateWorkingHoursDialog(
                                      day: 2,
                                      id: cubit.workOursList.any(
                                              (element) => element.day == 2)
                                          ? cubit.workOursList
                                              .firstWhere(
                                                  (element) => element.day == 2)
                                              .id!
                                          : null,
                                    ),
                                  );
                                },
                                isThereWorkingTime: cubit.workOursList
                                    .any((element) => element.day == 2),
                                from: cubit.workOursList
                                        .any((element) => element.day == 2)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 2)
                                        .from!
                                    : null,
                                to: cubit.workOursList
                                        .any((element) => element.day == 2)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 2)
                                        .to!
                                    : null),
                            SizedBox(
                              height: 20.h,
                            ),
                            TimeContainerWidget(
                                onLongPress: () {
                                  if(cubit.workOursList
                                      .any((element) => element.day == 3)){
                                    showDialog(
                                      context: context,
                                      builder: (context) => DeleteWorkTimeDialog(
                                        id: cubit.workOursList
                                            .firstWhere(
                                                (element) => element.day == 3)
                                            .id!,
                                      ),
                                    );
                                  }else{
                                    Fluttertoast.showToast(msg: 'لا يوجد توقيت للحذف',gravity: ToastGravity.CENTER,backgroundColor: Colors.red,);
                                  }
                                },
                                title: 'الثلثاء',
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AddOrUpdateWorkingHoursDialog(
                                      day: 3,
                                      id: cubit.workOursList.any(
                                              (element) => element.day == 3)
                                          ? cubit.workOursList
                                              .firstWhere(
                                                  (element) => element.day == 3)
                                              .id!
                                          : null,
                                    ),
                                  );
                                },
                                isThereWorkingTime: cubit.workOursList
                                    .any((element) => element.day == 3),
                                from: cubit.workOursList
                                        .any((element) => element.day == 3)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 3)
                                        .from!
                                    : null,
                                to: cubit.workOursList
                                        .any((element) => element.day == 3)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 3)
                                        .to!
                                    : null),
                            SizedBox(
                              height: 20.h,
                            ),
                            TimeContainerWidget(
                                onLongPress: () {
                                  if(cubit.workOursList
                                      .any((element) => element.day == 4)){
                                    showDialog(
                                      context: context,
                                      builder: (context) => DeleteWorkTimeDialog(
                                        id: cubit.workOursList
                                            .firstWhere(
                                                (element) => element.day == 4)
                                            .id!,
                                      ),
                                    );
                                  }else{
                                    Fluttertoast.showToast(msg: 'لا يوجد توقيت للحذف',gravity: ToastGravity.CENTER,backgroundColor: Colors.red,);
                                  }
                                },
                                title: 'الاربعاء',
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AddOrUpdateWorkingHoursDialog(
                                      day: 4,
                                      id: cubit.workOursList.any(
                                              (element) => element.day == 4)
                                          ? cubit.workOursList
                                              .firstWhere(
                                                  (element) => element.day == 4)
                                              .id!
                                          : null,
                                    ),
                                  );
                                },
                                isThereWorkingTime: cubit.workOursList
                                    .any((element) => element.day == 4),
                                from: cubit.workOursList
                                        .any((element) => element.day == 4)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 4)
                                        .from!
                                    : null,
                                to: cubit.workOursList
                                        .any((element) => element.day == 4)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 4)
                                        .to!
                                    : null),
                            SizedBox(
                              height: 20.h,
                            ),
                            TimeContainerWidget(
                                onLongPress: () {
                                  if(cubit.workOursList
                                      .any((element) => element.day == 5)){
                                    showDialog(
                                      context: context,
                                      builder: (context) => DeleteWorkTimeDialog(
                                        id: cubit.workOursList
                                            .firstWhere(
                                                (element) => element.day == 5)
                                            .id!,
                                      ),
                                    );
                                  }else{
                                    Fluttertoast.showToast(msg: 'لا يوجد توقيت للحذف',gravity: ToastGravity.CENTER,backgroundColor: Colors.red,);
                                  }
                                },
                                title: 'الخميس',
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AddOrUpdateWorkingHoursDialog(
                                      day: 5,
                                      id: cubit.workOursList.any(
                                              (element) => element.day == 5)
                                          ? cubit.workOursList
                                              .firstWhere(
                                                  (element) => element.day == 5)
                                              .id!
                                          : null,
                                    ),
                                  );
                                },
                                isThereWorkingTime: cubit.workOursList
                                    .any((element) => element.day == 5),
                                from: cubit.workOursList
                                        .any((element) => element.day == 5)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 5)
                                        .from!
                                    : null,
                                to: cubit.workOursList
                                        .any((element) => element.day == 5)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 5)
                                        .to!
                                    : null),
                            SizedBox(
                              height: 20.h,
                            ),
                            TimeContainerWidget(
                                onLongPress: () {
                                  if(cubit.workOursList
                                      .any((element) => element.day == 6)){
                                    showDialog(
                                      context: context,
                                      builder: (context) => DeleteWorkTimeDialog(
                                        id: cubit.workOursList
                                            .firstWhere(
                                                (element) => element.day == 6)
                                            .id!,
                                      ),
                                    );
                                  }else{
                                    Fluttertoast.showToast(msg: 'لا يوجد توقيت للحذف',gravity: ToastGravity.CENTER,backgroundColor: Colors.red,);
                                  }
                                },
                                title: 'الجمعه',
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AddOrUpdateWorkingHoursDialog(
                                      day: 6,
                                      id: cubit.workOursList.any(
                                              (element) => element.day == 6)
                                          ? cubit.workOursList
                                              .firstWhere(
                                                  (element) => element.day == 6)
                                              .id!
                                          : null,
                                    ),
                                  );
                                },
                                isThereWorkingTime: cubit.workOursList
                                    .any((element) => element.day == 6),
                                from: cubit.workOursList
                                        .any((element) => element.day == 6)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 6)
                                        .from!
                                    : null,
                                to: cubit.workOursList
                                        .any((element) => element.day == 6)
                                    ? cubit.workOursList
                                        .firstWhere(
                                            (element) => element.day == 6)
                                        .to!
                                    : null),
                            SizedBox(
                              height: 30.h,
                            ),

                          ]
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
// TimeContainerWidget(title:'الاحد')
}
