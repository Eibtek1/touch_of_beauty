import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../core/assets_path/images_path.dart';

class BackgroundScreenWithLogoWidget extends StatelessWidget {
  final double firstContainerBackgroundHeight;
  final Widget child;
  const BackgroundScreenWithLogoWidget({Key? key, required this.firstContainerBackgroundHeight, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: firstContainerBackgroundHeight+52.h,
                ),
                Container(
                  color: AppColorsLightTheme.primaryColor,
                  width: double.infinity,
                  height: firstContainerBackgroundHeight,
                ),
                Positioned(
                  bottom: 0,
                  left: (MediaQuery.of(context).size.width/2)-52.w,
                  child: Image.asset(
                    ImagePath.vendorLogo,
                    height: 104.h,
                    width: 104.w,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                width: double.infinity,
              ),
            ),
          ],
        ),
        child,
      ],
    );
  }
}
