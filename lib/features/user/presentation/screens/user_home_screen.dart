import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/custom_appbar.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/home_screen_widgets/build_custom_drawer.dart';
import '../widgets/home_screen_widgets/cursol_slider_widget.dart';
import '../widgets/home_screen_widgets/grid_item_builder.dart';
import '../widgets/home_screen_widgets/offers_item_builder.dart';
import '../widgets/home_screen_widgets/salon_item.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> imagesList = [
    ImagePath.carouselImage1,
    ImagePath.carouselImage2,
  ];


  List<Map<String, dynamic>> itemsList = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: AppDrawer(
        closeDrawer: () {
          _scaffoldKey.currentState!.closeDrawer();
          print(token);
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size(0, 70.h),
        child: CustomAppbar(
            openDrawer: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            titleName: 'محمد'),
      ),
      body: BlocConsumer<ServicesProvidersCubit, ServicesProvidersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = ServicesProvidersCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                CarouselSliderWidget(carouselItemsList: imagesList),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'ما الذي تريد أن تفعل؟',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xff1E2432)),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      state is GetFeaturedMainSectionsLoadingState?const Center(child: CircularProgressIndicator.adaptive(),):GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.mainSectionsFeaturedList.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) =>
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context,
                                      ScreenName.userCategoryDetailsScreen,
                                      arguments: cubit.mainSectionsFeaturedList[index].title);
                                },
                                child: GridItemBuilder(
                                  model: cubit.mainSectionsFeaturedList[index],
                                ),
                              )),
                      SizedBox(
                        height: 35.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'صالون مميز',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: FontPath.almaraiBold,
                                color: const Color(0xff1E2432)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ScreenName.allCentersScreen);
                            },
                            child: Text(
                              'شاهد الكل',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: FontPath.almaraiBold,
                                  color: AppColorsLightTheme.secondaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 195.h,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return const SalonItemBuilder();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'الصالونات التي تتبعها',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xff1E2432)),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 75.h,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 71.h,
                              width: 71.w,
                              padding: EdgeInsets.all(2.r),
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.grey, width: 0.9.w),
                                  shape: BoxShape.circle),
                              child: Image.asset(itemsList[index]['image']),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'احدث العروض',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: FontPath.almaraiBold,
                                color: const Color(0xff1E2432)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ScreenName.offersScreen);
                            },
                            child: Text(
                              'شاهد الكل',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: FontPath.almaraiBold,
                                  color: AppColorsLightTheme.secondaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const OffersItemBuilder(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
