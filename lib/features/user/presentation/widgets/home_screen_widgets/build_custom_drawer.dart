import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/cache_manager/cache_keys.dart';
import 'package:touch_of_beauty/core/cache_manager/shared_preferences.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../authentication/buisness_logic/auth_cubit.dart';
import '../../../../authentication/buisness_logic/auth_state.dart';
import '../../../../freelancer/buisness_logic/services_cubit/freelancer_services_cubit.dart';
import '../../../../vendor/buisness_logic/services_cubit/vendor_services_cubit.dart';
import '../../../buisness_logic/main_cubit/main_cubit.dart';
import '../../../buisness_logic/main_cubit/main_state.dart' as main_state;

class AppDrawer extends StatefulWidget {
  final Function closeDrawer;

  const AppDrawer({Key? key, required this.closeDrawer}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColorsLightTheme.primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: ListView(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    widget.closeDrawer();
                  },
                  child: Container(
                    height: 35.h,
                    width: 35.w,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.cancel_outlined,
                        color: const Color(0xffB83561),
                        size: 24.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocConsumer<MainCubit, main_state.MainState>(
              listener: (context, state) {},
              builder: (context, states) {
                var cubit = MainCubit.get(context);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: cubit.getUserModel == null?Shimmer.fromColors(
                        baseColor: Colors.grey[400]!,
                        highlightColor: Colors.grey[300]!,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ):CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: "${EndPoints.imageBaseUrl}${cubit.getUserModel!.userImgUrl}",
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[400]!,
                          highlightColor: Colors.grey[300]!,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      // Image.asset(
                      //   ImagePath.hairCare,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: states is! main_state.GetUserDataLoading
                          ? Text(
                              '${cubit.getUserModel!.fullName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontPath.almaraiBold,
                                  fontSize: 14.sp),
                            )
                          : Shimmer.fromColors(
                              baseColor: Colors.grey[400]!,
                              highlightColor: Colors.grey[300]!,
                              child: Container(
                                height: 20.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  // borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                    )
                  ],
                );
              },
            ),
            SizedBox(
              height: 47.h,
            ),
            buildTitleWidget(
              onTap: () {
                Navigator.pop(context);
                MainCubit.get(context).onTap(0);
              },
              title: LocaleKeys.home.tr(),
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {
                Navigator.pop(context);
                MainCubit.get(context).onTap(1);
              },
              title: LocaleKeys.my_reservations.tr(),
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {
                UserServicesCubit.get(context).getFavoritesServices();
                Navigator.pop(context);
                Navigator.pushNamed(context, ScreenName.favoritesServicesScreen);
              },
              title: LocaleKeys.fav.tr(),
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {
                UserServicesCubit.get(context).getAllQuestions();
                Navigator.pop(context);
                Navigator.pushNamed(context, ScreenName.allQuestionsScreen);
              },
              title: LocaleKeys.common_questions.tr(),
            ),
            SizedBox(
              height: 15.h,
            ),
            const Divider(
              color: Colors.white,
            ),
            // SizedBox(
            //   height: 15.h,
            // ),
            // buildTitleWidget(
            //   onTap: () {},
            //   title: 'تفضيلات التطبيق',
            // ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {
                Navigator.pop(context);
                MainCubit.get(context).onTap(3);
              },
              title: LocaleKeys.profile.tr(),
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    children: [
                      SimpleDialogOption(
                        onPressed: () async {
                          await context.setLocale(const Locale("en")).then((value) {
                            CacheHelper.saveData(key: CacheKeys.initialLocale, value: "en").whenComplete(() {
                              initialLocale = CacheHelper.getData(key: CacheKeys.initialLocale);
                              Navigator.pushNamedAndRemoveUntil(context, ScreenName.splashscreen, (route) => false);
                            });
                          });

                        },
                        child: const Text(
                          'English',
                        ),
                      ),
                      SimpleDialogOption(
                        onPressed: () async {
                          await context.setLocale(const Locale("ar")).then((value) {
                            CacheHelper.saveData(key: CacheKeys.initialLocale, value: "ar").whenComplete(() {
                              initialLocale = CacheHelper.getData(key: CacheKeys.initialLocale);
                              Navigator.pushNamedAndRemoveUntil(context, ScreenName.splashscreen, (route) => false);
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
              title: LocaleKeys.lang.tr(),
            ),
            SizedBox(
              height: 14.5.h,
            ),
            const Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, ScreenName.privacyScreen);
              },
              title: LocaleKeys.priv_policy.tr(),
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, ScreenName.complainsScreen);
              },
              title: LocaleKeys.complaints.tr(),
            ),
            SizedBox(
              height: 100.h,
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
                return InkWell(
                  onTap: () {
                    cubit.logout();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        size: 24.r,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        LocaleKeys.logout.tr(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: FontPath.almaraiLight,
                            color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitleWidget(
      {required void Function()? onTap, required String title}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 14.sp,
            fontFamily: FontPath.almaraiLight,
            color: Colors.white),
      ),
    );
  }
}
