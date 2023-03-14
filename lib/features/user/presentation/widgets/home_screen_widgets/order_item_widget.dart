import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/network/api_end_points.dart';

class OrderItemWidget extends StatelessWidget {
  final dynamic servicesModel;
  const OrderItemWidget({Key? key, required this.servicesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h,),
      child: Container(
        height: 95.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h,),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColorsLightTheme.smoothPageIndicatorGreyColor),
            ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              height: 70.h,
              width: 70.w,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                "${EndPoints.imageBaseUrl}${servicesModel.imgUrl}",
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
              // Image.asset(
              //   ImagePath.carouselImage1,
              //   fit: BoxFit.cover,
              // ),
            ),
            SizedBox(width: 20.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h,),
                  Expanded(
                    child: Text(
                      '${servicesModel.description}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff1E2432)),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '${servicesModel.finalPrice}  رس',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: const Color(0xffB83561),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '${servicesModel.title}',
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: AppColorsLightTheme.primaryColor,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
