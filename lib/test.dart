import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TryAWidget extends StatelessWidget {
  const TryAWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
            height: 6.h,
            width: 303.w,
            child: const CustomTimerProgress(
              maxTime: 60,
              minTime: 35,
              containerWidth: 303,
              progressColor: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTimerProgress extends StatelessWidget {
  final double maxTime;
  final double minTime;
  final double containerWidth;
  final Color progressColor;

  const CustomTimerProgress(
      {super.key,
      required this.maxTime,
      required this.minTime,
      required this.containerWidth,
      required this.progressColor});

  @override
  Widget build(context) {
    return Stack(
      children: [
        Container(
          height: 6.h,
          width: double.infinity,
          color: Colors.grey.shade300,
        ),
        Container(
          height: 6.h,
          width: minTime == maxTime
              ? double.infinity
              : minTime < maxTime
                  ? (containerWidth * (minTime / maxTime)).w
                  : 1.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white54,
                progressColor,
              ],
              end: Alignment.centerRight,
              begin: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }
}
