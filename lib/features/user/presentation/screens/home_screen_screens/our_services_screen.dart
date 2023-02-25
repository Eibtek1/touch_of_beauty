import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/services_bottom_sheet.dart';
import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/home_screen_widgets/center_services_item.dart';

class OurServicesScreen extends StatefulWidget {
  const OurServicesScreen({Key? key}) : super(key: key);

  @override
  State<OurServicesScreen> createState() => _OurServicesScreenState();
}

class _OurServicesScreenState extends State<OurServicesScreen> {
  @override
  void initState() {
    if (UserServicesCubit.get(context).citiesList.isEmpty) {
      UserServicesCubit.get(context).getCities();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'خدماتنا',
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
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      const Expanded(
                        child: CustomTextField(
                          hintText: 'ابحث عن خدمة',
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ScreenName.userSearchScreen);
                        },
                        child: Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              color: AppColorsLightTheme.secondaryColor
                                  .withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: Center(
                            child: SvgPicture.asset(SvgPath.settingsSliders),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20.r,
                        color: const Color(0xffB83561),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'الرجاء اختيار عنوانك',
                        style: TextStyle(
                            color: const Color(0xff263238),
                            fontFamily: FontPath.almaraiBold,
                            fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: state is! GetServicesByServiceProviderIdLoading
                      ? ListView.builder(
                          itemCount: cubit.servicesList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 20.w),
                              child: InkWell(
                                  onTap: () {
                                    showBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return ServicesBottomSheet(
                                            servicesModel:
                                                cubit.servicesList[index]);
                                      },
                                    );
                                  },
                                  child: CenterServicesCategoryItem(
                                    servicesModel: cubit.servicesList[index],
                                  )),
                            );
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
