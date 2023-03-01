import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../widgets/add_pictures_alert_dialog.dart';
import '../../widgets/center_details/custom_container.dart';
import '../../widgets/screen_layout_widget_with_logo.dart';

class CenterDetailsScreen extends StatelessWidget {
  const CenterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GetPickedImageSuccessState) {
          showDialog(
              context: context,
              builder: (context) => const AddImageAlertDialog());
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColorsLightTheme.primaryColor,
            foregroundColor: Colors.white,
            toolbarHeight: 60.h,
            centerTitle: true,
            title: Text(
              'بيانات المركز',
              style: TextStyle(
                fontSize: 17.sp,
                fontFamily: FontPath.almaraiBold,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    if (cubit.getUserModel != null)
                      Navigator.pushNamed(context, ScreenName.editCenterScreen);
                  },
                  icon: SvgPicture.asset(
                    SvgPath.edit,
                    width: 31.w,
                    height: 31.h,
                  )),
              SizedBox(
                width: 12.w,
              ),
            ],
          ),
          body: BackgroundScreenWithLogoWidget(
            firstContainerBackgroundHeight: 58.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: state is! GetUserDataLoading
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 130.h,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Text(
                                'صور للصالون أو الخدمات المقدمة',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: FontPath.almaraiBold,
                                  color: const Color(0xff3C475C),
                                ),
                              ),
                              SizedBox(
                                height: 11.h,
                              ),
                              Container(
                                height: 147.h,
                                width: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 0),
                                      color: Colors.black.withOpacity(0.14),
                                      blurRadius: 10.r,
                                    ),
                                  ],
                                ),
                                child: CachedNetworkImage(
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
                                ),
                                // Image.asset(
                                //   ImagePath.onboarding3,
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 75.h,
                                width: double.infinity,
                                child: ListView.builder(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 4.5.h),
                                  itemCount: cubit.picturesList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 70.h,
                                                width: 70.w,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColorsLightTheme
                                                          .primaryColor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.r),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset:
                                                            const Offset(0, 0),
                                                        color: Colors.black
                                                            .withOpacity(0.28),
                                                        blurRadius: 8.r)
                                                  ],
                                                ),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      '${EndPoints.imageBaseUrl}${cubit.picturesList[index].imgUrl}',
                                                  placeholder: (context, url) =>
                                                      Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey[400]!,
                                                    highlightColor:
                                                        Colors.grey[300]!,
                                                    child: Container(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                                // Image.asset(
                                                //   ImagePath.gallery13,
                                                //   fit: BoxFit.cover,
                                                // ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons
                                                          .delete,
                                                      size: 25.r,
                                                      color: Colors.red,
                                                    ),),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (index ==
                                            cubit.picturesList.length - 1)
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: InkWell(
                                              onTap: () {
                                                cubit.getImagePick();
                                              },
                                              child: Container(
                                                height: 46.h,
                                                width: 46.w,
                                                padding: EdgeInsets.all(10.r),
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            AppColorsLightTheme
                                                                .primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.r),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          offset: const Offset(
                                                              0, 0),
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.28),
                                                          blurRadius: 8.r)
                                                    ],
                                                    color: Colors.white),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    SvgPath.cameraPicture,
                                                    width: 30.w,
                                                    height: 30.h,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomDetailsContainer(
                                height: 64.h,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'اسم المركز',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: FontPath.almaraiBold,
                                        color: const Color(0xff8B8989),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.getUserModel!.fullName!,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: FontPath.almaraiBold,
                                          color: const Color(0xff8B8989),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              CustomDetailsContainer(
                                height: 190.h,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'وصف المركز',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: FontPath.almaraiBold,
                                        color: const Color(0xff8B8989),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11.h,
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.getUserModel!.description ??
                                            'قم بإضافة وصف للمركز',
                                        textAlign: TextAlign.start,
                                        maxLines: 5,
                                        style: TextStyle(
                                          height: 1.3.h,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12.sp,
                                          fontFamily: FontPath.almaraiRegular,
                                          color: const Color(0xff8B8989),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              CustomDetailsContainer(
                                height: 64.h,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'الرقم الضريبي',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: FontPath.almaraiBold,
                                        color: const Color(0xff8B8989),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.getUserModel!.taxNumber!,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: FontPath.almaraiBold,
                                          color: const Color(0xff8B8989),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              CustomDetailsContainer(
                                height: 64.h,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'رقم الهاتف',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: FontPath.almaraiBold,
                                        color: const Color(0xff8B8989),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.getUserModel!.phoneNumber ??
                                            'قم بإضافة رقم هاتف للمركز',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: FontPath.almaraiBold,
                                          color: const Color(0xff8B8989),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              CustomDetailsContainer(
                                height: 64.h,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'البريد الاليكتروني',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: FontPath.almaraiBold,
                                        color: const Color(0xff8B8989),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.getUserModel!.email ??
                                            'قم بإضافة رقم هاتف للمركز',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: FontPath.almaraiBold,
                                          color: const Color(0xff8B8989),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Row(
                                children: [
                                  CustomDetailsContainer(
                                    height: 44.h,
                                    width: 280.w,
                                    child: Text(
                                      'عنوان المركز',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: FontPath.almaraiBold,
                                        color: const Color(0xff8B8989),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 44.h,
                                    width: 45.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 12.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: AppColorsLightTheme
                                          .authTextFieldFillColor,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              CustomDetailsContainer(
                                height: 44.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'شهادة سجل المركز',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: FontPath.almaraiBold,
                                        color: const Color(0xff8B8989),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      SvgPath.paperPin,
                                      height: 22.h,
                                      width: 21.w,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
            ),
          ),
        );
      },
    );
  }
}
