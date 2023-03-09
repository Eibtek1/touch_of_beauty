import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/main_features_cubit/main_features_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/main_features_cubit/main_features_state.dart';
import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/home_screen_widgets/center_categories_details_item.dart';
import '../../widgets/home_screen_widgets/services_bottom_sheet.dart';

class MainFeatureServicesArgs {
  final String title;
  final int mainFeatureId;

  MainFeatureServicesArgs({required this.title, required this.mainFeatureId});
}

class CategoryDetailsScreen extends StatefulWidget {
  final String title;
  final int mainFeatureId;

  const CategoryDetailsScreen(
      {Key? key, required this.title, required this.mainFeatureId})
      : super(key: key);

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.title,
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
        body: BlocConsumer<MainFeaturesCubit, MainFeaturesState>(
          listener: (context, state) {
            var cubit = MainFeaturesCubit.get(context);
            if (cubit.getMainSectionServicesListLoading == false &&
                cubit.searchList.isEmpty &&
                cubit.servicesList.isNotEmpty &&
                searchController.text.isNotEmpty) {
              searchController.clear();
              Fluttertoast.showToast(
                msg: 'لا تتوفر عناصر البحث',
                gravity: ToastGravity.CENTER,
              );
            }
            if(state is GetServicesDetailsByItsIdSuccess&&cubit.servicesModel!=null){
              Navigator.pop(context);
              showBottomSheet(
                context: context,
                builder: (context) {
                  return ServicesBottomSheet(
                      servicesModel: cubit.servicesModel!);
                },
              );
            }
            if(state is GetServicesDetailsByItsIdLoadingState){
              showProgressIndicator(context);
            }
          },
          builder: (context, state) {
            var cubit = MainFeaturesCubit.get(context);
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchBarWidget(
                          onCancelSubmitted: () {
                            setState(() {
                              searchController.clear();
                              cubit.searchList.clear();
                              cubit.searchServicesPageNumber = 1;
                            });
                          },
                          onSearchIconSubmitted: () {
                            cubit.searchServicesPageNumber = 1;
                            cubit.searchForServicesOfServicesProviderByItsId(
                              searchName: searchController.text,
                              mainSectionId: widget.mainFeatureId,
                            );
                          },
                          width: double.infinity,
                          color: AppColorsLightTheme.authTextFieldFillColor,
                          controller: searchController,
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

                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: cubit.getMainSectionServicesListLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : ListView.builder(
                          itemCount: cubit.searchList.isNotEmpty
                              ? cubit.searchList.length
                              : cubit.servicesList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 20.w),
                              child: InkWell(
                                onTap: () {
                                  cubit.getServicesDetailsByItsId(id: cubit.searchList.isNotEmpty?cubit.searchList[index].id!:cubit.servicesList[index].id!);
                                },
                                child: CenterCategoryItem(
                                  servicesModel: cubit.searchList.isNotEmpty
                                      ? cubit.searchList[index]
                                      : cubit.servicesList[index],
                                ),
                              ),
                            );
                          },
                        ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
