import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/custom_appbar.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/home_screen_widgets/cursol_slider_widget.dart';
import '../widgets/home_screen_widgets/grid_item_builder.dart';
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
    {'image': ImagePath.beautyCenter, 'title': "فسم التجميل"},
    {'image': ImagePath.hairCare, 'title': "العناية بالشعر"},
    {'image': ImagePath.makeup, 'title': "فسم المكياج"},
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
      drawer: const Drawer(
        backgroundColor: AppColorsLightTheme.primaryColor,
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
                      itemBuilder: (context, index) => GridItemBuilder(
                            model: itemsList[index],
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
                      Text(
                        'شاهد الكل',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: AppColorsLightTheme.secondaryColor),
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
                      Text(
                        'شاهد الكل',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: AppColorsLightTheme.secondaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 133.h,
                    width: 377.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xff000000).withOpacity(0.29),
                              offset: Offset(0, 3.h),
                              blurRadius: 6.r)
                        ]),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: double.infinity,
                              width: 122.w,
                              child: Image.asset(
                                ImagePath.carouselImage1,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                top: 14.h,
                                left: 14.w,
                                child: CircleAvatar(
                                  radius: 10.r,
                                  backgroundColor: Colors.white,
                                  child: Center(
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: AppColorsLightTheme.secondaryColor,
                                      size: 12.r,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'شعر. الأظافر. الوجه',
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: FontPath.almaraiRegular,
                                  color: const Color(0xffCCB48C),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'صالون خانة الجمال',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: FontPath.almaraiBold,
                                    color: const Color(0xff1E2432)),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'الطريق العام الخرج - الرياض (365)',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: FontPath.almaraiRegular,
                                  color: const Color(0xff666666),
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    itemSize: 14.r,
                                    ignoreGestures: true,
                                    initialRating: 4,
                                    minRating: 1,
                                    unratedColor: Colors.white,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    // itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: AppColorsLightTheme.secondaryColor,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  SizedBox(
                                    width: 50.w,
                                  ),
                                  Text(
                                    '85% -',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: FontPath.almaraiRegular,
                                      color: const Color(0xff666666),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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
