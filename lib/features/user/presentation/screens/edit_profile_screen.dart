import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/custom_button.dart';

import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/svg_path.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/api_end_points.dart';
import '../../../authentication/buisness_logic/auth_cubit.dart';
import '../../../authentication/buisness_logic/auth_state.dart';
import '../../../vendor/presentation/widgets/center_details/custo_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text = AuthCubit.get(context).getUserModel!.fullName ?? '';
    phone.text = AuthCubit.get(context).getUserModel!.phoneNumber ?? '';
    email.text = AuthCubit.get(context).getUserModel!.email ?? '';
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
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
                          color: AppColorsLightTheme.primaryColor,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'تعديل الملف الشخصي',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontPath.almaraiBold,
                                    fontSize: 20.sp),
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
                          child: cubit.profileImage == null
                              ? Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 120.h,
                                      width: 120.w,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
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
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cubit.getImagePick();
                                      },
                                      icon: SvgPicture.asset(
                                        SvgPath.edit,
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                    ),
                                  ],
                                )
                              : Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 120.h,
                                      width: 120.w,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.file(
                                        cubit.profileImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cubit.getImagePick();
                                      },
                                      icon: SvgPicture.asset(
                                        SvgPath.edit,
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'الاسم',
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
                      controller: name,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'البريد الاليكتروني',
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
                      controller: email,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'رقم الهاتف',
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
                      controller: phone,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    CustomUserButton(
                      buttonTitle: 'تعديل',
                      isTapped: () {
                        // if(centerDetailsController.text.length>=5&&centerNameController.text.isNotEmpty&&centerEmailController.text.isNotEmpty&&centerPhoneController.text.isNotEmpty){
                        cubit.userUpdateProfile(
                          email: email.text,
                          name: name.text,
                          phoneNumber: phone.text,
                        );
                        // }
                      },
                      width: double.infinity,
                      paddingVertical: 12.h,
                      paddingHorizontal: 45.w,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
