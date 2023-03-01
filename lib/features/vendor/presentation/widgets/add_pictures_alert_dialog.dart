import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';

import '../../../../core/app_theme/light_theme.dart';
import '../../../freelancer/presentation/widgets/custom_vendor_button.dart';

class AddImageAlertDialog extends StatelessWidget {
  const AddImageAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 200.h,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AddPictureSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  padding: EdgeInsets.all(10.r),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColorsLightTheme.primaryColor),
                      borderRadius: BorderRadius.circular(2.r),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(0.28),
                          blurRadius: 8.r,
                        )
                      ],
                      color: Colors.white),
                  child: cubit.profileImage != null
                      ? Image.file(
                          cubit.profileImage!,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                SizedBox(height: 20.h,),
                state is! AddPictureLoading
                    ? CustomVendorButton(
                        buttonTitle: 'اضافة الصورة',
                        isTapped: () {
                          cubit.addPictureToLibrary();
                        },
                        width: double.infinity,
                        paddingVertical: 12.h,
                        paddingHorizontal: 45.w)
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
