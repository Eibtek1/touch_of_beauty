import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/svg_path.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/home_screen_widgets/all_centers_item.dart';

class AllCentersScreen extends StatelessWidget {
  const AllCentersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'مراكز الخدمة',
          style: TextStyle(
              color: const Color(0xff263238),
              fontFamily: FontPath.almaraiBold,
              fontSize: 18.sp),
        ),
        toolbarHeight: 60.h,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                const Expanded(
                    child: CustomTextField(hintText: 'ابحث عن خدمة')),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  height: 45.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      color:
                      AppColorsLightTheme.secondaryColor.withOpacity(0.2),
                      shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(SvgPath.settingsSliders),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const Divider(),
          Expanded(child: ListView.builder(itemBuilder: (BuildContext context, int index) { return AllCentersItemBuilder(); },itemCount: 5,))
        ],
      ),
    );
  }
}
