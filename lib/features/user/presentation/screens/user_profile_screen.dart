import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/core/network/api_end_points.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../translations/locale_keys.g.dart';
import '../widgets/delete_acc_alert_dialog.dart';
import '../widgets/profile_widgets/form_item_builder.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool isDeleteAcc = false;
  @override
  void didChangeDependencies() {
    if (AuthCubit.get(context).getUserModel == null) {
      AuthCubit.get(context).getUserData();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Column(
            children: [
              Container(
                height: 230.h,
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 50.h, left: 20.w, right: 20.w, bottom: 65.h),
                        width: double.infinity,
                        height: 150.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.r),
                              bottomRight: Radius.circular(30.r),
                            ),
                            color: AppColorsLightTheme.primaryColor),
                        child: Row(
                          children: [
                          SizedBox(
                          height: 22.h,
                          width: 22.w,
                          ),
                            Expanded(
                              child: Text(
                                LocaleKeys.profile.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontPath.almaraiBold,
                                    fontSize: 20.sp),
                              ),
                            ),
                            SizedBox(
                              height: 22.h,
                              width: 22.w,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ScreenName.editProfileScreen);
                                },
                                child: SvgPicture.asset(
                                  SvgPath.editIcon,
                                  width: 22.w,
                                  height: 22.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 130.h,
                        width: 130.w,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            height: 120.h,
                            width: 120.w,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: state is! GetUserDataLoading &&
                                    cubit.getUserModel != null
                                ? CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        '${EndPoints.imageBaseUrl}${cubit.getUserModel!.userImgUrl}',
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[400]!,
                                      highlightColor: Colors.grey[300]!,
                                      child: Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  )
                                : Shimmer.fromColors(
                                    baseColor: Colors.grey[400]!,
                                    highlightColor: Colors.grey[300]!,
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child:
                    state is! GetUserDataLoading && cubit.getUserModel != null
                        ? ListView(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            children: [
                              FormItemBuilder(
                                  image: SvgPath.profileFilledColorIcon,
                                  itemTitle: LocaleKeys.user_name.tr(),
                                  title: cubit.getUserModel!.fullName!),
                              // const Divider(),
                              // const FormItemBuilder(
                              //     image: SvgPath.location,
                              //     itemTitle: 'العنوان',
                              //     title: cubit.getUserModel!.),
                              const Divider(),
                              FormItemBuilder(
                                  image: SvgPath.email,
                                  itemTitle: LocaleKeys.email.tr(),
                                  title: cubit.getUserModel!.email!),
                              const Divider(),
                              FormItemBuilder(
                                  image: SvgPath.profileFilledColorIcon,
                                  itemTitle: LocaleKeys.phone_number.tr(),
                                  title: cubit.getUserModel!.phoneNumber!),
                              const Divider(),
                              InkWell(
                                onTap: (){
                                  showProgressIndicator(context);
                                  Future.delayed(const Duration(seconds: 2),(){
                                    Navigator.pop(context);
                                    showDialog(context: context, builder: (context) => const DeleteAccAlert());
                                  });
                                },
                                child: FormItemBuilder(
                                    image: SvgPath.edit,
                                    itemTitle: LocaleKeys.delete_account.tr(),
                                    title: LocaleKeys.click_to_delete_account.tr()),
                              ),
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
              )
            ],
          );
        },
      ),
    );
  }
}
