import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/skip_layout/scip_alert_dialog.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../core/assets_path/images_path.dart';

class SkipFeaturedServicesProvidersComponent extends StatefulWidget {
  const SkipFeaturedServicesProvidersComponent({Key? key}) : super(key: key);

  @override
  State<SkipFeaturedServicesProvidersComponent> createState() => _SkipFeaturedServicesProvidersComponentState();
}

class _SkipFeaturedServicesProvidersComponentState extends State<SkipFeaturedServicesProvidersComponent> {
  List<String> imagesList =[
    ImagePath.hairCare,
    ImagePath.onboarding2,
    ImagePath.naturalTherapy,
    ImagePath.makeup,
    ImagePath.onboarding1,
    ImagePath.selfCare,
    ImagePath.skinCare,
    ImagePath.onboarding3,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child:ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder:
            (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              showDialog(context: context, builder: (context) {
                return const SkipAlertDialog(title: 'يجب تسجيل الدخول لرؤية الصالونات المميزة',);
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                height: 190.h,
                width: 265.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.29),
                        offset: Offset(0, 3.h),
                        blurRadius: 6.r)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 118.h,
                          width: double.infinity,
                          child: Image.asset(imagesList[index],fit: BoxFit.cover,),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'صابونات مميزة',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: FontPath.almaraiBold,
                                      color: const Color(0xff1E2432)),
                                ),
                                RatingBar.builder(
                                  itemSize: 16.r,
                                  ignoreGestures: true,
                                  initialRating: 0,
                                  minRating: 1,
                                  unratedColor: Colors.grey.shade400,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  // itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                                  itemBuilder: (context, _) =>
                                  const Icon(
                                    Icons.star,
                                    color: AppColorsLightTheme.secondaryColor,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'المدينة حيث يتواجد الصالون المميز',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontFamily: FontPath.almaraiRegular,
                                color: const Color(0xff666666),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'وصف الصالون المميز وصف الصالون المميز',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: FontPath.almaraiRegular,
                                  color: const Color(0xff666666),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
