import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/custom_appbar.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../buisness_logic/main_features_cubit/main_features_cubit.dart';
import '../../buisness_logic/main_features_cubit/main_features_state.dart';
import '../widgets/home_screen_widgets/build_custom_drawer.dart';
import '../widgets/home_screen_widgets/cursol_slider_widget.dart';
import '../widgets/home_screen_widgets/grid_item_builder.dart';
import '../widgets/home_screen_widgets/salon_item.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    if(ServicesProvidersCubit.get(context).getServicesProviderModel!=null){
      if(ServicesProvidersCubit.get(context).getServicesProviderModel!.items!.isEmpty){
        ServicesProvidersCubit.get(context).getAllServicesProviders();
      }
    }else{
      ServicesProvidersCubit.get(context).getAllServicesProviders();
    }
    if(MainFeaturesCubit.get(context).mainSectionsFeaturedList.isEmpty){
      MainFeaturesCubit.get(context).getFeaturedMainSections();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: AppDrawer(
        closeDrawer: () {
          _scaffoldKey.currentState!.closeDrawer();
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size(0, 70.h),
        child: CustomAppbar(
            openDrawer: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            titleName: 'محمد'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            BlocBuilder<ServicesProvidersCubit, ServicesProvidersState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                var cubit = ServicesProvidersCubit.get(context);
                return cubit.getSliderPhotosLoading == false
                    ? CarouselSliderWidget(
                        carouselItemsList: cubit.sliderPhotosList)
                    : SizedBox(
                  height: 168.h,
                      child: const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                    );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'ما الذي تريد أن تفعل؟',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BlocConsumer<MainFeaturesCubit, MainFeaturesState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var cubit = MainFeaturesCubit.get(context);
                      return Column(
                        children: [
                          state is! GetFeaturedMainSectionsLoadingState
                              ? cubit.mainSectionsFeaturedList.isNotEmpty
                                  ? GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: cubit.mainSectionsFeaturedList
                                                  .length >
                                              8
                                          ? 8
                                          : cubit
                                              .mainSectionsFeaturedList.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        childAspectRatio: 1,
                                      ),
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          cubit.getServicesByMainFeatureId(id: cubit
                                              .mainSectionsFeaturedList[index].id!);
                                          Navigator.pushNamed(
                                              context,
                                              ScreenName
                                                  .userCategoryDetailsScreen,
                                              arguments: cubit
                                                  .mainSectionsFeaturedList[
                                                      index]
                                                  .title);
                                        },
                                        child: GridItemBuilder(
                                          model: cubit
                                              .mainSectionsFeaturedList[index],
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        'لا يوجد عناصر مميزة الان',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: FontPath.almaraiBold,
                                            color: const Color(0xff1E2432)),
                                      ),
                                    )
                              : const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'صالون مميز',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xff1E2432)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ScreenName.allCentersScreen);
                        },
                        child: Text(
                          'شاهد الكل',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: AppColorsLightTheme.secondaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BlocConsumer<ServicesProvidersCubit, ServicesProvidersState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var cubit = ServicesProvidersCubit.get(context);
                      return SizedBox(
                        height: 195.h,
                        child: state is! GetAllServicesProvidersLoadingState &&
                                state
                                    is! GetFeaturedServicesProvidersLoadingState &&
                                cubit.getServicesProviderModel != null
                            ? ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 3.h),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: cubit
                                    .getServicesProviderModel!.items!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SalonItemBuilder(
                                    servicesProviderModel: cubit
                                        .getServicesProviderModel!
                                        .items![index],
                                  );
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
