import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_state.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/about_widget.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 49.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 34.w,
                  height: 34.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      foregroundColor: AppColorsLightTheme.primaryColor,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColorsLightTheme.primaryColor,
                      size: 15.r,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'سياسة الخصوصية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 34.w,
                  height: 34.h,
                )
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: Image.asset(
                ImagePath.authLogo,
                width: 100.w,
                height: 100.h,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocConsumer<ServicesProvidersCubit, ServicesProvidersState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var cubit = ServicesProvidersCubit.get(context);
                return AboutWidget(
                  title:
                  '${cubit.contactUsModel!.termsAndConditions}',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
