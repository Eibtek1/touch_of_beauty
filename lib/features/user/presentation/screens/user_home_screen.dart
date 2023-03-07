import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/center_details_bottom_sheet.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/custom_appbar.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/network/api_end_points.dart';
import '../../buisness_logic/main_features_cubit/main_features_cubit.dart';
import '../../buisness_logic/main_features_cubit/main_features_state.dart';
import '../widgets/home_screen_widgets/build_custom_drawer.dart';
import '../widgets/home_screen_widgets/cursol_slider_widget.dart';
import '../widgets/home_screen_widgets/grid_item_builder.dart';
import '../widgets/home_screen_widgets/salon_item.dart';
import 'home_screen_screens/main_featuers_services.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    if (ServicesProvidersCubit.get(context)
        .featuredServicesProvidersList
        .isEmpty) {
      ServicesProvidersCubit.get(context).getFeaturedServicesProviders();
    }
    if (MainFeaturesCubit.get(context).mainSectionsFeaturedList.isEmpty) {
      MainFeaturesCubit.get(context).getFeaturedMainSections();
    }
    if (ServicesProvidersCubit.get(context).servicesProvidersList.isEmpty) {
      ServicesProvidersCubit.get(context).getAllServicesProviders();
    }
    UserServicesCubit.get(context).getAddress();
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
                    listener: (context, state) {},
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
                                          cubit.servicesPageNumber = 1;
                                          cubit.getServicesByMainFeaturesId(
                                              mainSectionId: cubit
                                                  .mainSectionsFeaturedList[
                                                      index]
                                                  .id!);
                                          Navigator.pushNamed(
                                              context,
                                              ScreenName
                                                  .userCategoryDetailsScreen,
                                              arguments: MainFeatureServicesArgs(
                                                  title: cubit
                                                      .mainSectionsFeaturedList[
                                                          index]
                                                      .title!,
                                                  mainFeatureId: cubit
                                                      .mainSectionsFeaturedList[
                                                          index]
                                                      .id!));
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
                          'شاهد كل الصالونات',
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
                    buildWhen: (p,a)=>p!=a,
                    listener: (context, state) {
                      var cubit = ServicesProvidersCubit.get(context);
                      if (state is GetFeaturedServicesProviderDetailsByItsIdSuccess && cubit.servicesProviderModel != null) {
                        Navigator.pop(context);
                        showBottomSheet(
                          context: context,
                          builder: (context) => CenterDetailsBottomSheet(
                            servicesProvidersModel:
                                cubit.servicesProviderModel!,
                          ),
                        );
                      }
                      if (state is GetFeaturedServicesProviderDetailsByItsIdLoadingState) {
                        showProgressIndicator(context);
                      }
                    },
                    builder: (context, state) {
                      var cubit = ServicesProvidersCubit.get(context);
                      return SizedBox(
                        height: cubit.featuredServicesProvidersList.isEmpty?40.h:195.h,
                        child: !cubit.getFeaturedServicesProviderLoading
                            ? cubit.featuredServicesProvidersList.isNotEmpty
                                ? ListView.builder(
                                    padding: EdgeInsets.symmetric(vertical: 3.h),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cubit
                                        .featuredServicesProvidersList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          cubit.getServicesProviderDataByItsId(
                                              id: cubit
                                                  .featuredServicesProvidersList[
                                                      index]
                                                  .id!);
                                        },
                                        child: SalonItemBuilder(
                                          servicesProviderModel: cubit
                                                  .featuredServicesProvidersList[
                                              index],
                                        ),
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      'لا يوجد صالونات مميزة',
                                      style: TextStyle(
                                          color:
                                              AppColorsLightTheme.primaryColor,
                                          fontFamily: FontPath.almaraiBold,
                                          fontSize: 16.sp),
                                    ),
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
                  Text(
                    'الصالونات التي تتابعها',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BlocConsumer<ServicesProvidersCubit, ServicesProvidersState>(
                    buildWhen: (p,a)=>p!=a,
                    listener: (context, state) {},
                    builder: (context, state) {
                      var cubit = ServicesProvidersCubit.get(context);
                      return SizedBox(
                        height: cubit.servicesProvidersList.isEmpty?40.h:75.h,
                        child: !cubit.getFeaturedServicesProviderLoading
                            ? cubit.servicesProvidersList.isNotEmpty
                                ? ListView.builder(
                                    padding: EdgeInsets.symmetric(vertical: 3.h),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cubit
                                        .servicesProvidersList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                                        child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          padding: EdgeInsets.all(2.r),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            border: Border.all(
                                              color: AppColorsLightTheme.primaryColor,
                                              width: 1.5.w,
                                            )
                                          ),
                                          child: Container(
                                            width: 70.w,
                                            height: 70.h,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child:  CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl:
                                              "${EndPoints.imageBaseUrl}${cubit
                                                  .servicesProvidersList[index]
                                                  .userImgUrl}",
                                              placeholder: (context, url) =>
                                                  Shimmer.fromColors(
                                                    baseColor: Colors.grey[400]!,
                                                    highlightColor: Colors.grey[300]!,
                                                    child: Container(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius: BorderRadius.circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                              errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      'لا يوجد صالونات مميزة',
                                      style: TextStyle(
                                          color:
                                              AppColorsLightTheme.primaryColor,
                                          fontFamily: FontPath.almaraiBold,
                                          fontSize: 16.sp),
                                    ),
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
