import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../data/models/search_button_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/home_screen_widgets/search_check_button_item.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget{
   SearchScreen({super.key});

  RangeValues currentRangeValues = const RangeValues(1, 999);
  final List<SearchCheckButtonModel> titleType = [
    SearchCheckButtonModel(title: 'صالونات', isChecked: false),
    SearchCheckButtonModel(title: 'أفراد', isChecked: false),
    SearchCheckButtonModel(title: 'الكل', isChecked: false),
  ];
   final List<SearchCheckButtonModel> city = [
    SearchCheckButtonModel(title: 'كل المدن', isChecked: false),
    SearchCheckButtonModel(title: 'الأحمدية', isChecked: false),
    SearchCheckButtonModel(title: 'الخيران', isChecked: false),
  ];
   final List<SearchCheckButtonModel> arrangement = [
    SearchCheckButtonModel(title: 'الأحدث', isChecked: false),
    SearchCheckButtonModel(title: 'الاقدم', isChecked: false),
  ];
   final List<SearchCheckButtonModel> ratting = [
    SearchCheckButtonModel(title: 'الأعلى تقيما', isChecked: false),
    SearchCheckButtonModel(title: 'الأقل تقيم', isChecked: false),
  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'خصائص البحث',
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
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
              return Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text('السعر',
                      style: TextStyle(
                          color: AppColorsLightTheme.searchScreenTextColor,
                          fontFamily: FontPath.almaraiRegular,
                          fontSize: 14.sp)),
                  RangeSlider(
                    max: 999,
                    min: 1,
                    inactiveColor: Colors.grey.withOpacity(0.5),
                    activeColor: AppColorsLightTheme.primaryColor,
                    values: currentRangeValues,
                    onChanged: (RangeValues values) {
                      setState(() {
                        currentRangeValues = values;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${currentRangeValues.start.round().toString()} ريال ',
                        style: TextStyle(
                            color: const Color(0xff757575),
                            fontFamily: FontPath.almaraiRegular,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        width: 144.w,
                      ),
                      Text(
                        '${currentRangeValues.end.round().toString()} ريال',
                        style: TextStyle(
                            color: const Color(0xff757575),
                            fontFamily: FontPath.almaraiRegular,
                            fontSize: 12.sp),
                      )
                    ],
                  ),
                ],
              );
            },),
            SizedBox(
              height: 23.h,
            ),
            Text('نوع الخدمة',
                style: TextStyle(
                    color: AppColorsLightTheme.searchScreenTextColor,
                    fontFamily: FontPath.almaraiRegular,
                    fontSize: 14.sp)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: titleType.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchCheckButtonItem(model: titleType[index]);
              },
            ),
            SizedBox(
              height: 22.h,
            ),
            Text('المدينة',
                style: TextStyle(
                    color: AppColorsLightTheme.searchScreenTextColor,
                    fontFamily: FontPath.almaraiRegular,
                    fontSize: 14.sp)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: city.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchCheckButtonItem(model: city[index]);
              },
            ),
            SizedBox(
              height: 22.h,
            ),
            Text('الترتيب',
                style: TextStyle(
                    color: AppColorsLightTheme.searchScreenTextColor,
                    fontFamily: FontPath.almaraiRegular,
                    fontSize: 14.sp)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: arrangement.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchCheckButtonItem(model: arrangement[index]);
              },
            ),
            SizedBox(
              height: 22.h,
            ),
            Text('التقييم',
                style: TextStyle(
                    color: AppColorsLightTheme.searchScreenTextColor,
                    fontFamily: FontPath.almaraiRegular,
                    fontSize: 14.sp)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ratting.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchCheckButtonItem(model: ratting[index]);
              },
            ),
            SizedBox(
              height: 22.h,
            ),
            CustomUserButton(buttonTitle: 'بحث', isTapped: (){}, width: double.infinity),
            SizedBox(
              height: 22.h,
            ),
          ],
        ),
      ),
    );
  }
}
