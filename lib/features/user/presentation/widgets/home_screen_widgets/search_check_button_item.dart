import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../data/models/search_button_model.dart';

class SearchCheckButtonItem extends StatefulWidget {
  final SearchCheckButtonModel model;

  const SearchCheckButtonItem({Key? key, required this.model})
      : super(key: key);

  @override
  State<SearchCheckButtonItem> createState() => _SearchCheckButtonItemState();
}

class _SearchCheckButtonItemState extends State<SearchCheckButtonItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        height: 48.h,
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              widget.model.isChecked = !widget.model.isChecked!;
            });
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColorsLightTheme.authTextFieldFillColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            side: BorderSide(width: widget.model.isChecked!?1.w:0,color: widget.model.isChecked!?AppColorsLightTheme.primaryColor:AppColorsLightTheme.smoothPageIndicatorGreyColor,style: BorderStyle.solid,)
          ),
          child: Row(
            children: [
              Checkbox(
                value: widget.model.isChecked,
                onChanged: (newValue) {
                  setState(() {
                    widget.model.isChecked = newValue;
                  });
                },
                shape: const CircleBorder(),
              ),
              SizedBox(width: 24.w,),
              Text(
                widget.model.title,
                style: TextStyle(
                    color: AppColorsLightTheme.searchScreenTextColor,
                    fontFamily: FontPath.almaraiRegular,
                    fontSize: 12.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
