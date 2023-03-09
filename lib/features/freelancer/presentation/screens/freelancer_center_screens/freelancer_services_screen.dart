import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/features/vendor/presentation/screens/vendor_center_screens/add_services_screen.dart';

import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';
import '../../../../../core/assets_path/svg_path.dart';
import '../../../../freelancer/presentation/widgets/custom_vendor_button.dart';
import '../../../../user/presentation/widgets/home_screen_widgets/grid_item_builder.dart';
import '../../../../vendor/presentation/widgets/screen_layout_widget_with_logo.dart';
import '../../../buisness_logic/services_cubit/freelancer_services_cubit.dart';
import '../../../buisness_logic/services_cubit/freelancer_services_state.dart';

class FreelancerServicesScreen extends StatelessWidget {
  FreelancerServicesScreen({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> itemsList = [
    {'image': ImagePath.babyCare, 'title': "العناية بالطفل"},
    {'image': ImagePath.beautyCenter, 'title': "قسم التجميل"},
    {'image': ImagePath.hairCare, 'title': "العناية بالشعر"},
    {'image': ImagePath.makeup, 'title': "قسم المكياج"},
    {'image': ImagePath.naturalTherapy, 'title': "العلاج الطبيعي"},
    {
      'image': ImagePath.photography,
      'title': "التصــــــــــــوير الفوتوغرافي"
    },
    {'image': ImagePath.selfCare, 'title': "العناية الشخصية"},
    {'image': ImagePath.skinCare, 'title': "العناية بالبشرة"},

    {'image': ImagePath.hairCare, 'title': "العناية بالشعر"},
    {'image': ImagePath.makeup, 'title': "قسم المكياج"},
    {'image': ImagePath.naturalTherapy, 'title': "العلاج الطبيعي"},
    {
      'image': ImagePath.photography,
      'title': "التصــــــــــــوير الفوتوغرافي"
    },
  ];

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
          'الخدمات',
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
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
      body: BackgroundScreenWithLogoWidget(
        firstContainerBackgroundHeight: 60.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocConsumer<FreelancerServicesCubit, FreelancerServicesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = FreelancerServicesCubit.get(context);
              return Column(
                children: [
                  SizedBox(
                    height: 130.h,
                  ),
                  SizedBox(
                    height: 400.h,
                    child: state is! GetServicesByServiceProviderIdLoading
                        ? GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.servicesList.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: GridItemBuilder(
                          model: cubit.servicesList[index],
                        ),
                      ),
                    )
                        : const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                  const Spacer(),
                  CustomVendorButton(
                      buttonTitle: 'اضافة خدمة جديدة',
                      isTapped: () {
                        Navigator.pushNamed(
                            context, ScreenName.vendorAddToServicesScreen,arguments: AddToServicesArguments(servicesModel: null, type: 1));
                      },
                      width: double.infinity,
                      paddingVertical: 14.h,
                      paddingHorizontal: 45.w),
                  SizedBox(
                    height: 40.h,
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
