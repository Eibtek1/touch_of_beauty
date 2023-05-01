import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
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
import '../../../../../core/network/api_end_points.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../user/buisness_logic/services_cubit/services_cubit.dart';
import '../../../../user/buisness_logic/services_cubit/services_state.dart';
import '../../../../user/presentation/screens/home_screen_screens/order_screens/add_address_screen.dart';
import '../../../../vendor/presentation/widgets/add_pictures_alert_dialog.dart';
import '../../../../vendor/presentation/widgets/center_details/custom_container.dart';
import '../../../../vendor/presentation/widgets/delete_picture_alert_dialog.dart';
import '../../../../vendor/presentation/widgets/screen_layout_widget_with_logo.dart';
import 'freelancer_image_screen.dart';

class FreelancerDetailsScreen extends StatelessWidget {
  const FreelancerDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorsLightTheme.primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text(
          LocaleKeys.services_provider_data.tr(),
          style: TextStyle(
            fontSize: 17.sp,
            fontFamily: FontPath.almaraiBold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (AuthCubit
                  .get(context)
                  .getUserModel != null) {
                Navigator.pushNamed(
                    context, ScreenName.freelancerEditDetailsScreen);
              }
            },
            icon: SvgPicture.asset(
              SvgPath.edit,
              width: 31.w,
              height: 31.h,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
      body: BackgroundScreenWithLogoWidget(
        firstContainerBackgroundHeight: 58.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120.h,
              ),
              Expanded(
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is GetPictureLibraryPickedSuccessState) {
                      showDialog(
                          context: context,
                          builder: (context) => const AddImageAlertDialog());
                    }
                  },
                  builder: (context, state) {
                    var cubit = AuthCubit.get(context);
                    return state is! GetUserDataLoading
                        ? ListView(
                      children: [
                        Text(
                          LocaleKeys.picture_of_services_store.tr(),
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
                            '${EndPoints.imageBaseUrl}${cubit.getUserModel!
                                .userImgUrl}',
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
                            itemCount: cubit.picturesList.isEmpty
                                ? 1
                                : cubit.picturesList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return cubit.picturesList.isNotEmpty
                                  ? Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 70.h,
                                          width: 70.w,
                                          clipBehavior: Clip
                                              .antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColorsLightTheme
                                                    .primaryColor),
                                            borderRadius:
                                            BorderRadius
                                                .circular(2.r),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset:
                                                  const Offset(
                                                      0, 0),
                                                  color: Colors
                                                      .black
                                                      .withOpacity(
                                                      0.28),
                                                  blurRadius: 8.r)
                                            ],
                                          ),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                            '${EndPoints.imageBaseUrl}${cubit
                                                .picturesList[index].imgUrl}',
                                            placeholder: (context,
                                                url) =>
                                                Shimmer.fromColors(
                                                  baseColor:
                                                  Colors.grey[400]!,
                                                  highlightColor:
                                                  Colors.grey[300]!,
                                                  child: Container(
                                                    height:
                                                    double.infinity,
                                                    width:
                                                    double.infinity,
                                                    decoration:
                                                    BoxDecoration(
                                                      color:
                                                      Colors.black,
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          8.0),
                                                    ),
                                                  ),
                                                ),
                                            errorWidget: (context,
                                                url, error) =>
                                            const Icon(
                                                Icons.error),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          child: IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      DeleteImageAlertDialog(
                                                        id: cubit
                                                            .picturesList[
                                                        index]
                                                            .id!,
                                                      ));
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              size: 25.r,
                                              color: Colors.red,
                                            ),
                                          ),
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
                                          cubit
                                              .getPictureLibraryImagePick();
                                        },
                                        child: Container(
                                          height: 46.h,
                                          width: 46.w,
                                          padding:
                                          EdgeInsets.all(10.r),
                                          clipBehavior: Clip
                                              .antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColorsLightTheme
                                                      .primaryColor),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  2.r),
                                              boxShadow: [
                                                BoxShadow(
                                                    offset:
                                                    const Offset(
                                                        0, 0),
                                                    color: Colors
                                                        .black
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
                              )
                                  : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w),
                                child: InkWell(
                                  onTap: () {
                                    cubit
                                        .getPictureLibraryImagePick();
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
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomDetailsContainer(
                          height: 68.h,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.services_provider_name.tr(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: FontPath.almaraiBold,
                                  color: const Color(0xff8B8989),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
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
                                LocaleKeys.discreption_of_services_provided
                                    .tr(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 10.sp,
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
                                      LocaleKeys.add_center_details.tr(),
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
                                LocaleKeys.phone_number.tr(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 10.sp,
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
                                      LocaleKeys.add_center_phone_number.tr(),
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
                        BlocBuilder<UserServicesCubit, UserServicesState>(
                          builder: (context, state) {
                            var cubit = UserServicesCubit.get(context);
                            return InkWell(
                              onTap: () {
                                if (state is! GetAddressLoading) {
                                  Navigator.pushNamed(context,
                                      ScreenName.addAddressScreen,
                                      arguments: AddAddressArgs(
                                          addressModel:
                                          cubit.addressList.isNotEmpty
                                              ? cubit.addressList[0]
                                              : null,
                                          userEqualsZeroVendorEqualsOne:
                                          1));
                                }
                              },
                              child: Row(
                                children: [
                                  CustomDetailsContainer(
                                    height: 64.h,
                                    width: 280.w,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LocaleKeys.address.tr(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily:
                                            FontPath.almaraiBold,
                                            color:
                                            const Color(0xff8B8989),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Expanded(
                                          child: Text(
                                            cubit.addressList.isNotEmpty
                                                ? cubit.addressList[0]
                                                .cityName!
                                                : LocaleKeys.add_address.tr(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily:
                                              FontPath.almaraiBold,
                                              color:
                                              const Color(0xff8B8989),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 64.h,
                                    width: 45.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 12.h),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8.r),
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
                            );
                          },
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        InkWell(
                          onTap: () {
                            if(cubit.getUserModel!.freelanceFormUrl!=null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => FreelancerImageScreen(imageUrl: cubit.getUserModel!.freelanceFormUrl!,)));
                            }
                          },
                          child: CustomDetailsContainer(
                            height: 44.h,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.registeration_certificate.tr(),
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
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    )
                        : const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
