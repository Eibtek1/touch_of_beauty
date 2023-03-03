import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({Key? key}) : super(key: key);

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 45.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColorsLightTheme.smoothPageIndicatorGreyColor,
        ),
        borderRadius: BorderRadius.circular(30.r)
      ),
      child: Row(
        children: [
           Expanded(
            child: TextField(
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none
              ),
              onTap: (){
                setState(() {
                  isTapped = true;
                });
              },
              onTapOutside: (pp){
                setState(() {
                  isTapped = false;
                });
              },
            ),
          ),
          if(!isTapped)Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundColor: AppColorsLightTheme.smoothPageIndicatorGreyColor,
                child: Icon(Icons.location_on_outlined,size: 20.r,color: Colors.grey,),
              ),
              SizedBox(width: 5.w,),
              CircleAvatar(
                radius: 16.r,
                backgroundColor: AppColorsLightTheme.smoothPageIndicatorGreyColor,
                child: Icon(Icons.add_a_photo_outlined,size: 20.r,color: Colors.grey,),
              ),
              SizedBox(width: 5.w,),
              CircleAvatar(
                radius: 16.r,
                backgroundColor: AppColorsLightTheme.smoothPageIndicatorGreyColor,
                child: Icon(Icons.perm_device_information_rounded,size: 20.r,color: Colors.grey,),
              )
            ],
          )
        ],
      ),
    );
  }
}
