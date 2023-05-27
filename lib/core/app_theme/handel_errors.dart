import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

class HandleError {
  static final toast = FToast();
  static const checkInternetConnection = Center(
    child: Text(
      'تأكد من اتصال الانترنت لديك',
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'tajwal',
      ),
    ),
  );

  static Widget selectDate = Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey.shade50,
        Colors.grey.shade100,
        Colors.grey.shade200,
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < 2; i++)
          Container(
            height: 150.h,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 15.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
          )
      ],
    ),
  );
}
