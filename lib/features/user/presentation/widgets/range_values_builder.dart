import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';

// ignore: must_be_immutable
class RangeValuesBuilder extends StatefulWidget {
  RangeValues rangeValues;
  RangeValuesBuilder({Key? key, required this.rangeValues}) : super(key: key);

  @override
  State<RangeValuesBuilder> createState() => _RangeValuesBuilderState();
}

class _RangeValuesBuilderState extends State<RangeValuesBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          max: 4000,
          min: 1,
          inactiveColor: Colors.grey.withOpacity(0.5),
          activeColor: AppColorsLightTheme.primaryColor,
          values: widget.rangeValues,
          onChanged: (RangeValues values){
            setState(() {
              widget.rangeValues = values;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.rangeValues.start.round().toString()} ريال ',
              style: TextStyle(
                  color: const Color(0xff757575),
                  fontFamily: FontPath.almaraiRegular,
                  fontSize: 12.sp),
            ),
            SizedBox(
              width: 144.w,
            ),
            Text(
              '${widget.rangeValues.end.round().toString()} ريال',
              style: TextStyle(
                  color: const Color(0xff757575),
                  fontFamily: FontPath.almaraiRegular,
                  fontSize: 12.sp),
            )
          ],
        )
      ],
    );
  }
}
