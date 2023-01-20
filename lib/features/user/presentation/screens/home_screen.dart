import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/custom_appbar.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/home_screen_widgets/cursol_slider_widget.dart';
import '../widgets/home_screen_widgets/grid_item_builder.dart';
import '../widgets/home_screen_widgets/offers_item_builder.dart';
import '../widgets/home_screen_widgets/salon_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      drawer: Drawer(
        backgroundColor: AppColorsLightTheme.primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 47.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      _scaffoldKey.currentState!.closeDrawer();
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
                        child: Icon(Icons.cancel_outlined,color: const Color(0xffB83561),size: 24.r,),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 43.h,),
              Row(
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
                    child: Image.asset(
                      ImagePath.hairCare,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'سارة احمد',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: FontPath.almaraiBold,
                        fontSize: 14.sp),
                  )
                ],
              ),
              SizedBox(height: 47.h,),
              Text(
                'من نحن',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontPath.almaraiLight,
                    color: Colors.white),
              ),
              SizedBox(height: 27.h,),
              Text(
                'ما هي مهمتنا',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontPath.almaraiLight,
                    color: Colors.white),
              ),
              SizedBox(height: 27.h,),
              Text(
                'اتصل بنا',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontPath.almaraiLight,
                    color: Colors.white),
              ),
              SizedBox(height: 27.h,),
              Text(
                'تقديم شكوى',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontPath.almaraiLight,
                    color: Colors.white),
              ),
              SizedBox(height: 15.h,),
              Container(
                height: 1.h,
                width: double.infinity,
                color: Colors.white,
              ),
              SizedBox(height: 200.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.exit_to_app,size: 24.r,color: Colors.white,),
                  SizedBox(width: 5.w,),
                  Text(
                    'تسجيل خروج',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: FontPath.almaraiLight,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(0, 70.h),
        child: CustomAppbar(
            openDrawer: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            titleName: 'محمد'),
      ),
      body: SingleChildScrollView(
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
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: itemsList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ScreenName.userCategoryDetailsScreen,
                                  arguments: itemsList[index]['title']);
                            },
                            child: GridItemBuilder(
                              model: itemsList[index],
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
                          Navigator.pushNamed(context, ScreenName.offersScreen);
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
      ),
    );
  }
}
