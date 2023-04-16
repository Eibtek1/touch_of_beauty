import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import 'package:touch_of_beauty/features/vendor/buisness_logic/services_cubit/vendor_services_cubit.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/svg_path.dart';
import '../../../freelancer/buisness_logic/services_cubit/freelancer_services_cubit.dart';
import '../../../user/presentation/widgets/delete_acc_alert_dialog.dart';
import '../widgets/build_center_item.dart';
import '../widgets/screen_layout_widget_with_logo.dart';

class VendorCentersScreen extends StatefulWidget {
  const VendorCentersScreen({Key? key}) : super(key: key);

  @override
  State<VendorCentersScreen> createState() => _VendorCentersScreenState();
}

class _VendorCentersScreenState extends State<VendorCentersScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                    onTap: () {
                      Navigator.pushNamed(
                          context, ScreenName.vendorNotificationScreen);
                    },
                    child: SvgPicture.asset(
                      SvgPath.notificationBill,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      height: 28.h,
                      width: 23.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 186.h,
              ),
              Expanded(
                child: ListView(
                  children: [
                    BuildCenterItem(
                      svgImage: SvgPath.centersIcon,
                      title: 'بيانات المركز',
                      onTap: () {
                        if (AuthCubit.get(context).getUserModel == null) {
                          AuthCubit.get(context).getUserData();
                        }
                        Navigator.pushNamed(
                            context, ScreenName.detailsCenterScreen);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    BuildCenterItem(
                      svgImage: SvgPath.clock,
                      title: 'مواعيد العمل',
                      onTap: () {
                        Navigator.pushNamed(
                            context, ScreenName.centerWorkingTimeScreen);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    BuildCenterItem(
                      svgImage: SvgPath.bag,
                      title: 'خدماتي',
                      onTap: () {
                        VendorServicesCubit.get(context)
                            .getServicesByServiceProviderId();
                        Navigator.pushNamed(
                            context, ScreenName.vendorServicesScreen);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    BuildCenterItem(
                      svgImage: SvgPath.calender2,
                      title: 'حجوزاتي',
                      onTap: () {
                        Navigator.pushNamed(
                            context, ScreenName.vendorReservationsScreen);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    BuildCenterItem(
                      svgImage: SvgPath.edit,
                      width: 20.w,
                      height: 20.h,
                      title: 'حذف الحساب',
                      onTap: () {
                        showProgressIndicator(context);
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) => const DeleteAccAlert());
                        });
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is LogoutLoading) {
                          showProgressIndicator(context);
                        }
                        if (state is LogoutError) {
                          Navigator.pop(context);
                        }
                        if (state is LogoutSuccess) {
                          VendorServicesCubit.get(context).servicesList = [];
                          VendorServicesCubit.get(context).servicesPageNumber =
                              1;
                          FreelancerServicesCubit.get(context)
                              .servicesPageNumber = 1;
                          Navigator.pushNamedAndRemoveUntil(context,
                              ScreenName.loginScreen, (route) => false);
                        }
                      },
                      builder: (context, state) {
                        var cubit = AuthCubit.get(context);
                        return BuildCenterItem(
                          svgImage: SvgPath.calender2,
                          title: 'تسجيل الخروج',
                          onTap: () {
                            // print(token);
                            cubit.logout();
                          },
                          child: Icon(
                            Icons.exit_to_app,
                            size: 24.r,
                            color: AppColorsLightTheme.primaryColor,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
