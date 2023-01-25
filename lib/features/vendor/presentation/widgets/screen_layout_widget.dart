import 'package:flutter/material.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

class BackgroundScreenWidget extends StatelessWidget {
  final double firstContainerBackgroundHeight;
  final Widget child;
  const BackgroundScreenWidget({Key? key, required this.firstContainerBackgroundHeight, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: AppColorsLightTheme.primaryColor,
              width: double.infinity,
              height: firstContainerBackgroundHeight,
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
