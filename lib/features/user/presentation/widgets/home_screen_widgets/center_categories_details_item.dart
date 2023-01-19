import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';

class CenterCategoryItem extends StatelessWidget {
  const CenterCategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        Icons.favorite,
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
                Row(
                  children: [
                    Text(
                      'صالون خانة الجمال',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff1E2432)),
                    ),
                    SizedBox(width: 54.w,),
                    Row(
                      children: [
                        Icon(Icons.star,size: 15.r,color: AppColorsLightTheme.secondaryColor,),
                        Text(
                          '(4.5)',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
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
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      'المدة 1ساعة',
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff666666),
                      ),
                    ),
                    SizedBox(
                      width: 76.w,
                    ),
                    Text(
                      '200  رس',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular,
                        color: const Color(0xffB83561),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
