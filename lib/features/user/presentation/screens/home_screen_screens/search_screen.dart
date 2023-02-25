import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../buisness_logic/services_cubit/services_cubit.dart';
import '../../../buisness_logic/services_cubit/services_state.dart';
import '../../../data/models/search_button_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/home_screen_widgets/search_check_button_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  RangeValues currentRangeValues = const RangeValues(1, 4000);

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

  bool value1 = false;
  bool value2 = false;

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
        body: BlocConsumer<UserServicesCubit, UserServicesState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = UserServicesCubit.get(context);
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'السعر',
                      style: TextStyle(
                        color: AppColorsLightTheme.searchScreenTextColor,
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 14.sp,
                      ),
                    ),
                    RangeSlider(
                      max: 4000,
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
                ),
                SizedBox(
                  height: 18.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          cubit.changeButtonState(onPressed: (){
                            cubit.inHome = !cubit.inHome;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                          backgroundColor: cubit.inHome?AppColorsLightTheme.primaryColor:AppColorsLightTheme.authTextFieldFillColor,
                            shape: const StadiumBorder()),
                        child: Text(
                          'الخدمات المنزلية',
                          style: TextStyle(
                              color: cubit.inHome?Colors.white:Colors.grey,
                              fontFamily: FontPath.almaraiRegular,
                              fontSize: 12.sp),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cubit.changeButtonState(onPressed: (){
                            cubit.inCenter = !cubit.inCenter;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                            backgroundColor: cubit.inCenter?AppColorsLightTheme.primaryColor:AppColorsLightTheme.authTextFieldFillColor,
                            shape: const StadiumBorder()),
                        child: Text(
                          'الخدمات بالمركز',
                          style: TextStyle(
                              color: cubit.inCenter?Colors.white:Colors.grey,
                              fontFamily: FontPath.almaraiRegular,
                              fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                ),
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
                    return SearchCheckButtonItem(
                      index: index,
                      currentIndex: cubit.servicesCI,
                      title: titleType[index].title,
                      onPressed: () {
                        cubit.changeButtonState(onPressed: () {
                          cubit.servicesCI = index;
                        }
                        );
                      },
                      onChanged: (value) {
                        cubit.changeButtonState(onPressed: () {
                          cubit.servicesCI = index;
                        }
                        );
                      },
                    );
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
                    return SearchCheckButtonItem(
                      title: city[index].title,
                      index: index,
                      currentIndex: cubit.cityCI,
                      onPressed: () {
                        cubit.changeButtonState(onPressed: () {
                          cubit.cityCI = index;
                        }
                        );
                      },
                      onChanged: (value) {
                        cubit.changeButtonState(onPressed: () {
                          cubit.cityCI = index;
                        }
                        );
                      },
                    );
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
                    return SearchCheckButtonItem(
                      onChanged: (value) {
                        cubit.changeButtonState(onPressed: () {
                          cubit.arrangementCI = index;
                        });
                      },
                      title: arrangement[index].title,
                      index: index,
                      currentIndex: cubit.arrangementCI,
                      onPressed: () {
                        cubit.changeButtonState(onPressed: () {
                          cubit.arrangementCI = index;
                        });
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 22.h,
                ),
                CustomUserButton(
                    buttonTitle: 'بحث',
                    isTapped: () {},
                    width: double.infinity,
                    paddingVertical: 16.h,
                    paddingHorizontal: 45.w),
                SizedBox(
                  height: 22.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
