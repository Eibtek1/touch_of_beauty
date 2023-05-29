import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/features/vendor/buisness_logic/services_cubit/vendor_services_cubit.dart';

import '../../../../core/app_router/screens_name.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/svg_path.dart';
import '../../../../core/cache_manager/cache_keys.dart';
import '../../../../core/cache_manager/shared_preferences.dart';
import '../../../../core/constants/constants.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../authentication/buisness_logic/auth_cubit.dart';
import '../../../authentication/buisness_logic/auth_state.dart';
import '../../../user/presentation/widgets/delete_acc_alert_dialog.dart';
import '../../../vendor/presentation/widgets/screen_layout_widget_with_logo.dart';
import '../../buisness_logic/services_cubit/freelancer_services_cubit.dart';
import '../widgets/build_freelancer_profile_item.dart';

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
                      LocaleKeys.center.tr(),
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
                          context, ScreenName.freelancerNotificationScreen);
                    },
                    child: SvgPicture.asset(
                      SvgPath.notificationBill,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
                    BuildFreelancerProfileItem(
                      svgImage: SvgPath.centersIcon,
                      title: LocaleKeys.services_provider_data.tr(),
                      onTap: () {
                        if (AuthCubit.get(context).getUserModel == null) {
                          AuthCubit.get(context).getUserData();
                        }
                        Navigator.pushNamed(
                            context, ScreenName.freelancerDetailsScreen);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    BuildFreelancerProfileItem(
                      svgImage: SvgPath.clock,
                      title: LocaleKeys.working_hours.tr(),
                      onTap: () {
                        Navigator.pushNamed(
                            context, ScreenName.freelancerTimeScreen);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    BuildFreelancerProfileItem(
                      svgImage: SvgPath.bag,
                      title: LocaleKeys.my_services.tr(),
                      onTap: () {
                        VendorServicesCubit.get(context)
                            .getServicesByServiceProviderId();
                        Navigator.pushNamed(
                            context, ScreenName.freelancerServicesScreen);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is DeleteAccountLoading) {
                          showProgressIndicator(context);
                        }
                        if (state is DeleteAccountSuccess) {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) => DeleteAccAlert(
                                    text: state.message,
                                  ));
                        }
                      },
                      builder: (context, state) {
                        var cubit = AuthCubit.get(context);
                        return BuildFreelancerProfileItem(
                          svgImage: SvgPath.edit,
                          width: 20.w,
                          height: 20.h,
                          title: LocaleKeys.delete_account.tr(),
                          onTap: () {
                            cubit.deleteUserAccount();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    BuildFreelancerProfileItem(
                      svgImage: SvgPath.calender2,
                      title: LocaleKeys.my_reservations.tr(),
                      onTap: () {
                        Navigator.pushNamed(
                            context, ScreenName.vendorReservationsScreen);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    BuildFreelancerProfileItem(
                      svgImage: SvgPath.bulb,
                      title: LocaleKeys.lang.tr(),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            children: [
                              SimpleDialogOption(
                                onPressed: () async {
                                  VendorServicesCubit.get(context)
                                      .servicesPageNumber = 1;
                                  VendorServicesCubit.get(context)
                                      .servicesList = [];
                                  await context
                                      .setLocale(const Locale("en"))
                                      .then((value) {
                                    CacheHelper.saveData(
                                            key: CacheKeys.initialLocale,
                                            value: "en")
                                        .whenComplete(() {
                                      freelancerItemsList = [
                                        LocaleKeys.in_home.tr(),
                                      ];
                                      todayTo = [
                                        LocaleKeys.today.tr(),
                                        LocaleKeys.yesterday.tr(),
                                      ];
                                      initialLocale = CacheHelper.getData(
                                          key: CacheKeys.initialLocale);
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          ScreenName.splashscreen,
                                          (route) => false);
                                    });
                                  });
                                },
                                child: const Text(
                                  'English',
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () async {
                                  VendorServicesCubit.get(context)
                                      .servicesPageNumber = 1;
                                  VendorServicesCubit.get(context)
                                      .servicesList = [];
                                  await context
                                      .setLocale(const Locale("ar"))
                                      .then((value) {
                                    CacheHelper.saveData(
                                            key: CacheKeys.initialLocale,
                                            value: "ar")
                                        .whenComplete(() {
                                      freelancerItemsList = [
                                        LocaleKeys.in_home.tr(),
                                      ];
                                      todayTo = [
                                        LocaleKeys.today.tr(),
                                        LocaleKeys.yesterday.tr(),
                                      ];
                                      initialLocale = CacheHelper.getData(
                                          key: CacheKeys.initialLocale);
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          ScreenName.splashscreen,
                                          (route) => false);
                                    });
                                  });
                                },
                                child: const Text(
                                  'Arabic',
                                ),
                              ),
                            ],
                          ),
                        );
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
                        return BuildFreelancerProfileItem(
                          svgImage: SvgPath.calender2,
                          title: LocaleKeys.logout.tr(),
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
                    BuildFreelancerProfileItem(
                      svgImage: SvgPath.edit,
                      width: 20.w,
                      height: 20.h,
                      title: LocaleKeys.complaints.tr(),
                      onTap: () {
                        Navigator.pushNamed(
                            context, ScreenName.complainsScreen);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
