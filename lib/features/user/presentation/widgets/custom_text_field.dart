// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
//
// import '../../../../core/assets_path/font_path.dart';
//
// class CustomTextField extends StatelessWidget {
//   final String hintText;
//   const CustomTextField({Key? key, required this.hintText,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.r),
//             borderSide: const BorderSide(
//                 color: AppColorsLightTheme.authTextFieldFillColor)),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.r),
//             borderSide: const BorderSide(
//                 color: AppColorsLightTheme.authTextFieldFillColor)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.r),
//             borderSide: const BorderSide(
//                 color: AppColorsLightTheme.authTextFieldFillColor)),
//         filled: true,
//         fillColor: AppColorsLightTheme.authTextFieldFillColor,
//         hintText: hintText,
//         hintStyle: TextStyle(
//             color: Colors.grey,
//             fontSize: 14.sp,
//             fontFamily: FontPath.poppinsBold),
//         contentPadding: EdgeInsets.all(10.r),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/assets_path/font_path.dart';

import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/svg_path.dart';

class SearchBarWidget extends StatefulWidget {
  final double width;
  final Color color;
  final TextEditingController controller;
  final Function(String? value)? searchedFunction;
  final Function(String? value)? submittedSearch;
  final bool isOnChangeSearchSearch;
  final Function? onSearchIconSubmitted;
  final Function? onCancelSubmitted;

  const SearchBarWidget({
    Key? key,
    required this.width,
    required this.color,
    this.searchedFunction,
    required this.controller,
    this.submittedSearch,
    this.onSearchIconSubmitted,
    this.isOnChangeSearchSearch = false,
    this.onCancelSubmitted,
  }) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool isCancelShown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: widget.width,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColorsLightTheme.authTextFieldFillColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                style: TextStyle(
                    fontSize: 14.sp, fontFamily: FontPath.almaraiRegular),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'ابحث الان',
                    hintStyle: TextStyle(
                        fontSize: 12.sp, fontFamily: FontPath.almaraiRegular),
                    contentPadding: EdgeInsets.only(bottom: 5.h)),
                onChanged: (string) {
                  if (widget.controller.text.isNotEmpty) {
                    setState(() {
                      isCancelShown = true;
                    });
                  }
                  if (widget.isOnChangeSearchSearch) {
                    widget.searchedFunction!(string);
                  }
                },
                onSubmitted: (value) {
                  widget.submittedSearch!(value);
                },
              ),
            ),
            if (isCancelShown)
              InkWell(
                  onTap: () {
                    widget.onCancelSubmitted!();
                    setState(() {
                      isCancelShown = false;
                    });
                  },
                  child: Icon(
                    Icons.cancel_outlined,
                    color: Colors.black.withOpacity(0.5),
                    size: 27.r,
                  )),
            SizedBox(
              width: 5.w,
            ),
            InkWell(
              onTap: () {
                widget.onSearchIconSubmitted!();
              },
              child: Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorsLightTheme.secondaryColor.withOpacity(0.2),
                ),
                padding: EdgeInsets.only(
                    left: 6.w, right: 6.w, bottom: 6.w, top: 6.w),
                child: SvgPicture.asset(
                  SvgPath.searchIcon,
                  width: 30.w,
                  height: 30.h,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
