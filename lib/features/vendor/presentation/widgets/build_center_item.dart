import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';

class BuildCenterItem extends StatelessWidget {
  final String title;
  final String svgImage;
  final Widget? child;
      final double? width;
  final double? height;
      final Function onTap;
  const BuildCenterItem({Key? key, required this.title, this.child, this.width, this.height, required this.onTap, required this.svgImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: child ?? SvgPicture.asset(
        svgImage,
        width: width,
        height: height,
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
