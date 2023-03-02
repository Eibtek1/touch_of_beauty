import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';

import '../../../../core/assets_path/font_path.dart';
import '../../../freelancer/presentation/widgets/custom_vendor_button.dart';

class DeleteImageAlertDialog extends StatelessWidget {
  final int id;
  const DeleteImageAlertDialog({
    Key? key, required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 170.h,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is DeletePictureSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
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
                  'هل انت متأكد من مسح الصورة',
                  style: TextStyle(
                      color: const Color(0xffABABAB),
                      fontFamily: FontPath.almaraiRegular,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                state is! DeletePictureLoading
                    ? CustomVendorButton(
                        isDeleteAlertDialog: true,
                        buttonTitle: 'مسح الصورة',
                        isTapped: () {
                          cubit.deletePictureToLibrary(id: id);
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
