import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import 'package:touch_of_beauty/features/vendor/presentation/widgets/custom_vendor_button.dart';
import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/svg_path.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../authentication/buisness_logic/auth_cubit.dart';
import '../../../../vendor/presentation/widgets/center_details/custo_text_form_field.dart';
import '../../../../vendor/presentation/widgets/center_details/custom_container.dart';
import '../../../../vendor/presentation/widgets/screen_layout_widget_with_logo.dart';
import 'freelancer_image_screen.dart';

class EditFreelancerDetailsScreen extends StatelessWidget {
  EditFreelancerDetailsScreen({Key? key}) : super(key: key);

  final TextEditingController centerNameController = TextEditingController();

  final TextEditingController centerDetailsController = TextEditingController();

  final TextEditingController centerPhoneController = TextEditingController();
  final TextEditingController centerEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    centerNameController.text =
        AuthCubit.get(context).getUserModel!.fullName ?? '';
    centerDetailsController.text =
        AuthCubit.get(context).getUserModel!.description ?? "";
    centerEmailController.text =
        AuthCubit.get(context).getUserModel!.email ?? "";
    centerPhoneController.text =
        AuthCubit.get(context).getUserModel!.phoneNumber ?? '';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorsLightTheme.primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text(
          LocaleKeys.edit_center_details.tr(),
          style: TextStyle(
            fontSize: 17.sp,
            fontFamily: FontPath.almaraiBold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, ScreenName.freelancerNotificationScreen);
            },
            icon: SvgPicture.asset(
              SvgPath.notificationBill,
              width: 23.w,
              height: 28.h,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              var cubit = AuthCubit.get(context);
              if (state is UpdateProfileLoading) {
                showProgressIndicator(context);
              }
              if (state is UpdateProfileSuccess) {
                Navigator.pop(context);
                cubit.getUserData();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return Column(
                children: [
                  SizedBox(
                    height: 130.h,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Text(
                          LocaleKeys.images_of_services.tr(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xff3C475C),
                          ),
                        ),
                        SizedBox(
                          height: 11.h,
                        ),
                        Stack(
                          children: [
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
                                  )
                                ],
                              ),
                              child: cubit.profileImage == null
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
                                  : Image.file(
                                      cubit.profileImage!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Positioned(
                              top: 10.h,
                              left: 12.w,
                              child: IconButton(
                                onPressed: () {
                                  cubit.getImagePick();
                                },
                                icon: SvgPicture.asset(
                                  SvgPath.edit,
                                  width: 22.w,
                                  height: 22.h,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          LocaleKeys.center_name.tr(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xff3C475C),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextFormField(
                          height: 44.h,
                          width: double.infinity,
                          controller: centerNameController,
                        ),
                        Text(
                          LocaleKeys.email.tr(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xff3C475C),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextFormField(
                          height: 44.h,
                          width: double.infinity,
                          controller: centerEmailController,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          LocaleKeys.center_details.tr(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xff3C475C),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextFormField(
                          isDetails: true,
                          height: 190.h,
                          width: double.infinity,
                          controller: centerDetailsController,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          LocaleKeys.phone_number.tr(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xff3C475C),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextFormField(
                          height: 44.h,
                          width: double.infinity,
                          controller: centerPhoneController,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        SizedBox(
                          height: 5.h,
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
                        CustomVendorButton(
                          buttonTitle: LocaleKeys.edit.tr(),
                          isTapped: () {
                            cubit.freelancerUpdateProfile(
                              userName: centerNameController.text,
                              email: centerEmailController.text,
                              description: centerDetailsController.text,
                              phone: centerPhoneController.text,
                            );
                          },
                          width: double.infinity,
                          paddingVertical: 12.h,
                          paddingHorizontal: 45.w,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
