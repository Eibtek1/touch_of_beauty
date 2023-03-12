import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../../authentication/buisness_logic/auth_cubit.dart';
import '../../../../authentication/buisness_logic/auth_state.dart';
import '../../../buisness_logic/main_cubit/main_cubit.dart';
import '../../../buisness_logic/main_cubit/main_state.dart' as main_state;

class AppDrawer extends StatelessWidget {
  final Function closeDrawer;

  const AppDrawer({Key? key, required this.closeDrawer}) : super(key: key);

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
                    closeDrawer();
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
              onTap: () {},
              title: 'الصفحة الرئيسية',
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {},
              title: 'الحجوزات',
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {},
              title: 'المفضلة',
            ),
            SizedBox(
              height: 15.h,
            ),
            const Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {},
              title: 'تفضيلات التطبيق',
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {},
              title: 'حساب',
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {},
              title: 'اللغات',
            ),
            SizedBox(
              height: 15.h,
            ),
            const Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {},
              title: 'المساعدة والخصوصية',
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {},
              title: 'سياسة خصوصية',
            ),
            SizedBox(
              height: 15.h,
            ),
            buildTitleWidget(
              onTap: () {
                Navigator.pushNamed(context, ScreenName.complainsScreen);
              },
              title: 'الشكاوي',
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
                        'تسجيل خروج',
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
