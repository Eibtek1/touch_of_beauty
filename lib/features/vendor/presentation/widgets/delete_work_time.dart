import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';

import '../../../../core/assets_path/font_path.dart';
import '../../../freelancer/presentation/widgets/custom_vendor_button.dart';
import '../../buisness_logic/work_hours_cubit/work_hours_cubit.dart';
import '../../buisness_logic/work_hours_cubit/work_hours_state.dart';

class DeleteWorkTimeDialog extends StatelessWidget {
  final int id;

  const DeleteWorkTimeDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 170.h,
        child: BlocConsumer<WorkHoursCubit, WorkHoursState>(
          listener: (context, state) {
            var cubit = WorkHoursCubit.get(context);
            if (state is DeleteWorkHoursSuccess) {
              cubit.getWorkHours();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            var cubit = WorkHoursCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImagePath.deleteIcon,
                  width: 50.w,
                  height: 50.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'هل انت متأكد من حذف التوقيت',
                  style: TextStyle(
                      color: const Color(0xffABABAB),
                      fontFamily: FontPath.almaraiRegular,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                state is! DeleteWorkHoursLoading
                    ? CustomVendorButton(
                        isDeleteAlertDialog: true,
                        buttonTitle: 'حذف التوقيت',
                        isTapped: () {
                          cubit.deleteWorkHours(id: id);
                        },
                        width: 120.w,
                        paddingVertical: 10.h,
                        paddingHorizontal: 1.w)
                    : const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
