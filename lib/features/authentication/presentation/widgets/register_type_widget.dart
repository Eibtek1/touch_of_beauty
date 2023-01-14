import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';

// ignore: must_be_immutable
class ChooseRegisterType extends StatefulWidget {
  late bool type;
  ChooseRegisterType({Key? key, required this.type}) : super(key: key);

  @override
  State<ChooseRegisterType> createState() => _ChooseRegisterTypeState();
}

class _ChooseRegisterTypeState extends State<ChooseRegisterType> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 162.w,
          height: 44.h,
          child: OutlinedButton(
            onPressed: () {
              setState((){
                widget.type = true;
              });
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r),
                ),
              ),
              side: MaterialStateProperty.all(
                BorderSide(
                    color: widget.type?AppColorsLightTheme.primaryColor:const Color(0xff696969).withOpacity(0.4),
                    width: 0.8.w),
              ),
            ),
            child: Row(
              children: [
                if(widget.type)const Icon(
                  Icons.check_circle,
                  color: AppColorsLightTheme.primaryColor,
                ),
                Expanded(
                  child: Text(
                    'طالب خدمة',
                    textAlign:TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff666666),
                        fontFamily: FontPath.almaraiBold,
                        fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 162.w,
          height: 44.h,
          child: OutlinedButton(
            onPressed: () {
              setState((){
                widget.type = false;
              });
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r),
                ),
              ),
              side: MaterialStateProperty.all(
                BorderSide(
                    color: !widget.type?AppColorsLightTheme.primaryColor:const Color(0xff696969).withOpacity(0.4),
                    width: 0.8.w),
              ),
            ),
            child: Row(
              children: [
                if(!widget.type)const Icon(
                  Icons.check_circle,
                  color: AppColorsLightTheme.primaryColor,
                ),
                Expanded(
                  child: Text(
                    'مقدمة خدمة' ,
                    textAlign:TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff666666),
                        fontFamily: FontPath.almaraiBold,
                        fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
