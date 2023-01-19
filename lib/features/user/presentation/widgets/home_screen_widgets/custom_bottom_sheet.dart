import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/custom_button.dart';
import '../../../../../core/assets_path/font_path.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({Key? key}) : super(key: key);
  final List<String> boarding = [
    ImagePath.onboarding2,
    ImagePath.onboarding3,
  ];
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 280.h,
              width: double.infinity,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r))),
              child: PageView.builder(
                itemCount: boarding.length,
                controller: pageViewController,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    boarding[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 156.w,
              right: 158.w,
              child: SmoothPageIndicator(
                controller: pageViewController,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                    dotHeight: 8.h,
                    dotWidth: 8.w,
                    expansionFactor: 3,
                    spacing: 5.w,
                    activeDotColor: AppColorsLightTheme.secondaryColor,
                    dotColor: AppColorsLightTheme.smoothPageIndicatorGreyColor),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            children: [
              Text(
                'العناية بالبشرة',
                style: TextStyle(
                    color: const Color(0xff263238),
                    fontFamily: FontPath.almaraiBold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Colors.grey,
                    size: 15.r,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'مدة الخدمة 1 ساعة',
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontFamily: FontPath.almaraiBold,
                      color: const Color(0xff666666),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Text(
                    '200  رس',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: const Color(0xffB83561),
                    ),
                  ),
                  SizedBox(
                    width: 170.w,
                  ),
                  Container(
                    width: 50.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color:
                            AppColorsLightTheme.primaryColor.withOpacity(0.3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '25% -',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: FontPath.almaraiRegular,
                            color: const Color(0xff666666),
                          ),
                        ),
                        Icon(
                          Icons.local_offer_rounded,
                          color: AppColorsLightTheme.primaryColor,
                          size: 15.r,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              const Divider(),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'وصف الخدمة',
                style: TextStyle(
                    color: const Color(0xff263238),
                    fontFamily: FontPath.almaraiBold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،لقد تم توليد هذا النص هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،لقد تم توليد هذا النص',
                style: TextStyle(
                  height: 1.2.h,
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: const Color(0xff666666),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Divider(),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'مقدم الخدمة',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ScreenName.allCentersScreen);
                    },
                    child: Text(
                      'عرض المزيد',
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
              Container(
                height: 87.h,
                width: double.infinity,
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
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomUserButton(
                  buttonTitle: 'اطلب الخدمة',
                  isTapped: () {},
                  width: double.infinity),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        )
      ],
    );
  }
}
