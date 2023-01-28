import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitchButton extends StatefulWidget {
  const CustomSwitchButton({Key? key}) : super(key: key);

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isOnOrOff = false;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOnOrOff = !isOnOrOff;
        });
      },
      child: SizedBox(
        width: 41.w,
        height: 21.h,
        child: Stack(
          children: [
            Container(
              height: 21.h,
              width: 41.w,
              decoration: BoxDecoration(
                  color: isOnOrOff?Colors.grey:const Color(0xff3C475C),
                  borderRadius: BorderRadius.circular(15.r),),
            ),
            AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              alignment: isOnOrOff ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 150),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 6.r,
              ),
            )
          ],
        ),
      ),
    );
  }
}
