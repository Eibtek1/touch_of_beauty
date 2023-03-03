import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/build_another_person_message_item.dart';
import '../widgets/build_my_message_item.dart';
import '../widgets/chat_text_field.dart';

class ChatScreen extends StatefulWidget {
  final dynamic title;

  const ChatScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> messagesList = [
    {
      'id': 1,
      'message': 'مرحبا كيف حالك استاذ؟',
      'time': '4:25',
    },
    {
      'id': 2,
      'message': 'مرحبا كيف حالك استاذ؟',
      'time': '4:25',
    },
    {
      'id': 1,
      'message': 'مرحبا كيف حالك استاذ؟',
      'time': '4:25',
    },
    {
      'id': 2,
      'message': 'مرحبا كيف حالك استاذ؟',
      'time': '4:25',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              color: const Color(0xff263238),
              fontFamily: FontPath.almaraiBold,
              fontSize: 18.sp),
        ),
        toolbarHeight: 60.h,
        titleSpacing: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 18.0.w),
            child: SvgPicture.asset(
              SvgPath.chatActionsAppBarIcon,
              height: 40.h,
              width: 40.w,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                itemBuilder: (BuildContext context, int index) {
                  if (messagesList[index]['id'] == 1) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: MyMessageItem(
                          message: messagesList[index]['message'],
                          time: messagesList[index]['time']),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: AnotherPersonMessageItem(
                          message: messagesList[index]['message'],
                          time: messagesList[index]['time']),
                    );
                  }
                },
                itemCount: messagesList.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SizedBox(
                height: 150.h,
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width:50.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                        ),

                        child:  Directionality(
                          textDirection: TextDirection.ltr,
                          child: Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 24.r,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Expanded(child: ChatTextField())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
