import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';
import '../../../../../core/assets_path/svg_path.dart';
import '../../../../freelancer/presentation/widgets/custom_vendor_button.dart';
import '../../../../vendor/presentation/widgets/center_details/custo_text_form_field.dart';
import '../../../../vendor/presentation/widgets/screen_layout_widget_with_logo.dart';

class FreelancerAddServicesScreen extends StatelessWidget {
  const FreelancerAddServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController centerPhoneController = TextEditingController();
    final TextEditingController centerNameController = TextEditingController();
    final TextEditingController centerDetailsController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorsLightTheme.primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text(
          'تعديل بيانات المركز',
          style: TextStyle(
            fontSize: 17.sp,
            fontFamily: FontPath.almaraiBold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.vendorNotificationScreen);
            },
            icon: SvgPicture.asset(
              SvgPath.notificationBill,
              width: 23.w,
              height: 28.h,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
                    Stack(
                      alignment: Alignment.center,
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
                              ],),
                          child: Image.asset(
                            ImagePath.onboarding3,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Icon(Icons.camera_alt,size: 28.r,color: Colors.white24,)
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'اسم الخدمة',
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
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      'وصف الخدمة',
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
                      height: 190.h,
                      width: double.infinity,
                      controller: centerDetailsController,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      'مدة الخدمة',
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
                    Text(
                      'تكلفة الخدمة',
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
                    Text(
                      'اضافة خدمة فرعية',
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
                      height: 20.h,
                    ),
                    CustomVendorButton(buttonTitle: 'تعديل', isTapped: (){}, width: double.infinity, paddingVertical: 12.h, paddingHorizontal: 45.w),
                    SizedBox(
                      height: 20.h,
                    ),
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
