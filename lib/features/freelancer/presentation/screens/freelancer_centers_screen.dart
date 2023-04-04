import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/features/vendor/buisness_logic/services_cubit/vendor_services_cubit.dart';

import '../../../../core/app_router/screens_name.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/svg_path.dart';
import '../../../../core/constants/constants.dart';
import '../../../authentication/buisness_logic/auth_cubit.dart';
import '../../../authentication/buisness_logic/auth_state.dart';
import '../../../vendor/presentation/widgets/screen_layout_widget_with_logo.dart';

class FreelancerCentersScreen extends StatelessWidget {
  const FreelancerCentersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreenWithLogoWidget(
        firstContainerBackgroundHeight: 151.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'المركز',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 17.sp),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ScreenName.freelancerNotificationScreen);
                    },
                    child: SvgPicture.asset(
                      SvgPath.notificationBill,
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      height: 28.h,
                      width: 23.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 186.h,
              ),
              buildItem1(svgImage: SvgPath.centersIcon, title: 'بيانات مقدم الخدمة', onTap: (){
                if (AuthCubit.get(context).getUserModel == null) {
                  AuthCubit.get(context).getUserData();
                }
                Navigator.pushNamed(context, ScreenName.freelancerDetailsScreen);
              }),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
              buildItem1(svgImage: SvgPath.clock, title: 'مواعيد العمل', onTap: (){
                Navigator.pushNamed(context, ScreenName.freelancerTimeScreen);
              }),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
              buildItem1(svgImage: SvgPath.bag, title: 'خدماتي', onTap: (){
                VendorServicesCubit.get(context).getServicesByServiceProviderId();
                Navigator.pushNamed(context, ScreenName.freelancerServicesScreen);
              },),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
              buildItem1(svgImage: SvgPath.calender2, title: 'حجوزاتي', onTap: (){
                Navigator.pushNamed(context, ScreenName.vendorReservationsScreen);
              }),
              SizedBox(
                height: 10.h,
              ),

              const Divider(),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if(state is LogoutLoading){
                    showProgressIndicator(context);
                  }
                  if(state is LogoutError){
                    Navigator.pop(context);
                  }
                  if(state is LogoutSuccess){
                    Navigator.pushNamedAndRemoveUntil(context, ScreenName.loginScreen, (route) => false);
                  }
                },
                builder: (context, state) {
                  var cubit = AuthCubit.get(context);
                  return buildItem1(
                    svgImage: SvgPath.calender2,
                    child: Icon(
                      Icons.exit_to_app,
                      size: 24.r,
                      color: AppColorsLightTheme.primaryColor,
                    ),
                    title: 'تسجيل الخروج',
                    onTap: () {
                      // print(token);
                      cubit.logout();
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildItem1({required String svgImage,
    required String title,
    Widget? child,
    required Function onTap}) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: child ?? SvgPicture.asset(
        svgImage,
        colorFilter: const ColorFilter.mode(
          AppColorsLightTheme.primaryColor,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: const Color(0xff3C475C),
            fontSize: 14.sp,
            fontFamily: FontPath.almaraiRegular),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
