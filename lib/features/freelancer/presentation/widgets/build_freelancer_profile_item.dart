import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';

class BuildFreelancerProfileItem extends StatelessWidget {
  final String svgImage;
  final double? width;
  final double? height;
  final String title;
  final Widget? child;
  final Function onTap;

  const BuildFreelancerProfileItem({Key? key, required this.svgImage, this.width, this.height, required this.title, this.child, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: child ??
          SvgPicture.asset(
            svgImage,
            height: height,
            width: width,
            colorFilter: const ColorFilter.mode(
              AppColorsLightTheme.primaryColor,
              BlendMode.srcIn,
            ),
          ),
      title: Text(
        title,
        style: TextStyle(
            color: const Color(0xff3C475C),
            fontSize: 14.sp,
            fontFamily: FontPath.almaraiRegular),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
