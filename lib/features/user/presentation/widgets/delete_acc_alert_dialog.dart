import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_router/screens_name.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/constants/constants.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../authentication/buisness_logic/auth_cubit.dart';
import '../../../authentication/buisness_logic/auth_state.dart';
import '../../../freelancer/buisness_logic/services_cubit/freelancer_services_cubit.dart';
import '../../../freelancer/presentation/widgets/custom_vendor_button.dart';
import '../../../vendor/buisness_logic/services_cubit/vendor_services_cubit.dart';
import '../../buisness_logic/main_cubit/main_cubit.dart';

class DeleteAccAlert extends StatelessWidget {
  final String text;

  const DeleteAccAlert({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 150.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: FontPath.poppinsRegular),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LogoutLoading) {
                  showProgressIndicator(context);
                }
                if (state is LogoutError) {
                  Navigator.pop(context);
                }
                if (state is LogoutSuccess) {
                  MainCubit.get(context).onTap(0);

                  VendorServicesCubit.get(context).servicesList = [];
                  VendorServicesCubit.get(context).servicesPageNumber = 1;
                  FreelancerServicesCubit.get(context).servicesPageNumber = 1;
                  Navigator.pushNamedAndRemoveUntil(
                      context, ScreenName.loginScreen, (route) => false);
                }
              },
              builder: (context, state) {
                var cubit = AuthCubit.get(context);
                return CustomVendorButton(
                    buttonTitle: LocaleKeys.done.tr(),
                    isTapped: () {
                      Navigator.pop(context);
                      cubit.logout();
                    },
                    width: double.infinity,
                    paddingVertical: 12.h,
                    paddingHorizontal: 45.w);
              },
            )
          ],
        ),
      ),
    );
  }
}
