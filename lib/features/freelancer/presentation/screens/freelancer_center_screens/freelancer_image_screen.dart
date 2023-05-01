import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/network/api_end_points.dart';

class FreelancerImageScreen extends StatelessWidget {
  final String imageUrl;
  const FreelancerImageScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: PinchZoom(
            resetDuration: const Duration(milliseconds: 100),
            maxScale: 2.5,
            onZoomStart: (){},
            onZoomEnd: (){},
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
              '${EndPoints.imageBaseUrl}$imageUrl',
              placeholder: (context, url) =>
                  Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[300]!,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                        BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
            ),
          ),
          // child: Image.asset(ImagePath.categoriesDetails,fit: BoxFit.contain,),
        ),
      ),
    );
  }
}
