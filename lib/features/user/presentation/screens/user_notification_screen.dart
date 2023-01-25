import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets_path/font_path.dart';
import '../widgets/notification_widget/notification_item_builder.dart';

class UserNotificationScreen extends StatelessWidget {
  const UserNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70.h,
        centerTitle: true,
        title: Text(
          'الاشعارات',
          style: TextStyle(
              fontSize: 20.sp,
              fontFamily: FontPath.almaraiBold,
              color: const Color(0xff1E2432)),
        ),
      ),
      body: ListView.builder(itemCount: 5,itemBuilder: (BuildContext context, int index) { return const NotificationItemBuilder(); },),
    );
  }
}
