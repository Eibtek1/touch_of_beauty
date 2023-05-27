import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

class customBlurryModal extends StatelessWidget {
  customBlurryModal(
      {super.key,
        required this.isLoading,
        required this.widget,
        required this.circleSize});
  Widget widget;
  bool isLoading;
  double circleSize;
  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        blurEffectIntensity: 4,
        progressIndicator: SpinKitFadingCircle(
          color: AppColorsLightTheme.primaryColor,
          size: circleSize,
        ),
        dismissible: false,
        opacity: 0.4,
        color: AppColorsLightTheme.primaryColor,
        child: widget);
  }
}