import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/features/user/data/models/services_model.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/network/api_end_points.dart';

class CenterCategoryItem extends StatelessWidget {
  final ServicesModel servicesModel;

  const CenterCategoryItem({Key? key, required this.servicesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133.h,
      width: 377.w,
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
      child: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: 122.w,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: "${EndPoints.imageBaseUrl}${servicesModel.imgUrl}",
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      servicesModel.title!,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff1E2432)),
                    ),
                    SizedBox(
                      width: 54.w,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 15.r,
                          color: AppColorsLightTheme.secondaryColor,
                        ),
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
                HtmlWidget(servicesModel.description!),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      '${servicesModel.price!}  رس',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2.h,
                        fontSize: 8.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff666666),
                      ),
                    ),
                    SizedBox(
                      width: 76.w,
                    ),
                    Text(
                      '${servicesModel.finalPrice!}  رس',
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
