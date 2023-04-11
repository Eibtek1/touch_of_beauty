import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class AboutWidget extends StatelessWidget {
  final String title;

  const AboutWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 5.r,
          ),
          SizedBox(
            width: 9.w,
          ),
          Expanded(
            child: HtmlWidget(
              title,
            ),
          ),
        ],
      ),
    );
  }
}
