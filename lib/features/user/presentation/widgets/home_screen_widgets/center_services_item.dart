import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';

class CenterServicesCategoryItem extends StatelessWidget {
  const CenterServicesCategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      child: Container(
        height: 140.h,
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
                  width: 100.w,
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
                    Text(
                      'جلسة بوتكس',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff1E2432)),
                    ),
                    SizedBox(
                      height: 10.h,
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
                          width: 76.w,
                        ),
                        Text(
                          'المدة 1ساعة',
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xff666666),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،لقد تم توليد ',
                      style: TextStyle(
                        height: 1.2.h,
                        fontSize: 10.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff666666),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outlined,size: 24.r,color: AppColorsLightTheme.primaryColor,)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
