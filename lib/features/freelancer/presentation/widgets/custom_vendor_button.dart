import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';

class CustomVendorButton extends StatelessWidget {
  final String buttonTitle;
  final Function isTapped;
  final double? height;
  final double width;
  final double paddingVertical;
  final double paddingHorizontal;
  final bool isDeleteAlertDialog;

  const CustomVendorButton(
      {Key? key,
        required this.buttonTitle,
        required this.isTapped,
        required this.width, this.height, required this.paddingVertical, required this.paddingHorizontal, this.isDeleteAlertDialog = false, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDeleteAlertDialog?Colors.red:AppColorsLightTheme.primaryColor,
          shape: const StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
        ),
        onPressed: () {
          isTapped();
        },

        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
                color: Colors.white,
                fontFamily: FontPath.almaraiBold,
                fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
