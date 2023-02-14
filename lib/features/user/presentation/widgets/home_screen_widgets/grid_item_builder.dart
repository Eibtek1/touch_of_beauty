import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/network/api_end_points.dart';

import '../../../../../core/assets_path/font_path.dart';

class GridItemBuilder extends StatelessWidget {
  final dynamic model;

  const GridItemBuilder({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 67.h,
          width: 67.w,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: "${EndPoints.imageBaseUrl}${model.imgUrl}",
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
        SizedBox(
          height: 5.h,
        ),
        Expanded(
          child: Text(
            model.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 10.sp,
                fontFamily: FontPath.almaraiRegular,
                color: const Color(0xff666666)),
          ),
        ),
      ],
    );
  }
}
