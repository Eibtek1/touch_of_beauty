import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

// ignore: must_be_immutable
class ChatTextField extends StatefulWidget {
  final TextEditingController controller;
   bool isTapped ;
   final void Function()? pickFileFunction;
   final void Function()? pickImageFunction;
   ChatTextField({Key? key, required this.controller,this.isTapped= false, this.pickFileFunction, this.pickImageFunction}) : super(key: key);

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {

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
              controller: widget.controller,
              decoration: const InputDecoration(
                border: InputBorder.none
              ),
              onChanged: (value){
                if(widget.controller.text.length==1){
                  setState(() {
                    widget.isTapped = true;
                  });
                }else if(widget.controller.text.isEmpty&&widget.isTapped == true){
                  setState(() {
                    widget.isTapped = false;
                  });
                }
              },
            ),
          ),
          if(!widget.isTapped)Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundColor: AppColorsLightTheme.smoothPageIndicatorGreyColor,
                child: Icon(Icons.location_on_outlined,size: 20.r,color: Colors.grey,),
              ),
              SizedBox(width: 5.w,),
              InkWell(
                onTap: widget.pickImageFunction,
                child: CircleAvatar(
                  radius: 16.r,
                  backgroundColor: AppColorsLightTheme.smoothPageIndicatorGreyColor,
                  child: Icon(Icons.add_a_photo_outlined,size: 20.r,color: Colors.grey,),
                ),
              ),
              SizedBox(width: 5.w,),
              InkWell(
                onTap: widget.pickFileFunction,
                child: CircleAvatar(
                  radius: 16.r,
                  backgroundColor: AppColorsLightTheme.smoothPageIndicatorGreyColor,
                  child: Icon(Icons.file_copy_outlined,size: 20.r,color: Colors.grey,),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
