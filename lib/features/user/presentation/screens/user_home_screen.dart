import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/main_cubit/main_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/main_cubit/main_state.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/center_details_bottom_sheet.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/custom_appbar.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../buisness_logic/main_features_cubit/main_features_cubit.dart';
import '../../buisness_logic/main_features_cubit/main_features_state.dart';
import '../../buisness_logic/services_cubit/services_state.dart';
import '../widgets/home_screen_widgets/cursol_slider_widget.dart';
import '../widgets/home_screen_widgets/fav_services_builder.dart';
import '../widgets/home_screen_widgets/favorite_services_provider_item_builder.dart';
import '../widgets/home_screen_widgets/grid_item_builder.dart';
import '../widgets/home_screen_widgets/salon_item.dart';
import '../widgets/home_screen_widgets/services_bottom_sheet.dart';
import 'home_screen_screens/main_featuers_services.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  void initState() {
    print(token);
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
    if (ServicesProvidersCubit.get(context)
        .favoritesServicesProvidersList
        .isEmpty) {
      ServicesProvidersCubit.get(context).getFavoritesServicesProviders();
    }
    if (UserServicesCubit.get(context).favoriteServicesList.isEmpty) {
      UserServicesCubit.get(context).getFavoritesServices();
    }
    UserServicesCubit.get(context).getAddress();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(0, 70.h),
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = MainCubit.get(context);
            return CustomAppbar(
                openDrawer: () {
                  cubit.scaffoldKey.currentState!.openDrawer();
                },
                titleName: state is GetUserDataLoading?"":cubit.getUserModel!.fullName!.split(" ").first);
          },
        ),
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
                    buildWhen: (p, c) => p != c,
                    listener: (context, state) {
                      var cubit = ServicesProvidersCubit.get(context);
                      if (state
                              is GetFeaturedServicesProviderDetailsByItsIdSuccess &&
                          cubit.servicesProviderModel != null) {
                        Navigator.pop(context);
                        showBottomSheet(
                          context: context,
                          builder: (context) => CenterDetailsBottomSheet(
                            servicesProvidersModel:
                                cubit.servicesProviderModel!,
                          ),
                        );
                      }
                      if (state
                          is GetFeaturedServicesProviderDetailsByItsIdLoadingState) {
                        showProgressIndicator(context);
                      }
                    },
                    builder: (context, state) {
                      var cubit = ServicesProvidersCubit.get(context);
                      return SizedBox(
                        height: cubit.featuredServicesProvidersList.isEmpty
                            ? 40.h
                            : 195.h,
                        child: !cubit.getFeaturedServicesProviderLoading
                            ? cubit.featuredServicesProvidersList.isNotEmpty
                                ? ListView.builder(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 3.h),
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
                                                  .providerId!);
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
                    'الصالونات المفضلة',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BlocConsumer<ServicesProvidersCubit, ServicesProvidersState>(
                    buildWhen: (p, a) => p != a,
                    listener: (context, state) {
                      var cubit = ServicesProvidersCubit.get(context);
                      if (state is GetFavoriteServicesProviderDetailsByItsIdSuccess &&
                          cubit.servicesProviderModel != null) {
                        Navigator.pop(context);
                        UserServicesCubit.get(context).tabBarCIndex = 0;
                        UserServicesCubit.get(context).changeTabBarCurrentIndex(0,
                            servicesProviderId: cubit.servicesProviderModel!.id!,
                            mainSectionId: cubit
                                .servicesProviderModel!.mainSection![0].mainSectionId!);
                        showBottomSheet(
                          context: context,
                          builder: (context) => CenterDetailsBottomSheet(
                            servicesProvidersModel:
                                cubit.servicesProviderModel!,
                          ),
                        );
                      }
                      if (state
                          is GetFavoriteServicesProviderDetailsByItsIdLoadingState) {
                        showProgressIndicator(context);
                      }
                    },
                    builder: (context, state) {
                      var cubit = ServicesProvidersCubit.get(context);
                      return SizedBox(
                        height: cubit.favoritesServicesProvidersList.isEmpty
                            ? 40.h
                            : 195.h,
                        child: !cubit.getFavoriteServicesProviderLoading
                            ? cubit.favoritesServicesProvidersList.isNotEmpty
                                ? ListView.builder(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 3.h),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cubit
                                        .favoritesServicesProvidersList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          cubit.getFavoriteServicesProviderDataByItsId(
                                              id: cubit
                                                  .favoritesServicesProvidersList[
                                                      index]
                                                  .providerId!);
                                        },
                                        child: FavoriteSalonItemBuilder(
                                          servicesProviderModel: cubit
                                                  .favoritesServicesProvidersList[
                                              index],
                                          delete: () {
                                            cubit.deleteServicesProviderToFavorite(
                                                id: cubit
                                                    .favoritesServicesProvidersList[
                                                        index]
                                                    .providerId!);
                                          },
                                        ),
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      'لا يوجد صالونات مفضلة',
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
                    'الخدمات المفضلة',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BlocConsumer<UserServicesCubit, UserServicesState>(
                    listener: (context, state) {
                      var cubit = UserServicesCubit.get(context);
                      if (state
                              is GetServicesDetailsInCentersBottomSheetByItsIdSuccess &&
                          cubit.servicesModel != null) {
                        Navigator.pop(context);
                        showBottomSheet(
                          context: context,
                          builder: (context) {
                            return ServicesBottomSheet(
                                servicesModel: cubit.servicesModel!);
                          },
                        );
                      }
                      if (state
                          is GetServicesDetailsInCentersBottomSheetByItsIdLoadingState) {
                        showProgressIndicator(context);
                      }
                    },
                    builder: (context, state) {
                      var cubit = UserServicesCubit.get(context);
                      return SizedBox(
                        height:
                            cubit.favoriteServicesList.isEmpty ? 40.h : 195.h,
                        child: !cubit.getFavoriteServicesLoading
                            ? cubit.favoriteServicesList.isNotEmpty
                                ? ListView.builder(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 3.h),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          cubit
                                              .getServicesDetailsInCentersBottomSheetByItsId(
                                                  id: cubit
                                                      .favoriteServicesList[
                                                          index]
                                                      .serviceId!);
                                        },
                                        child: FavoriteServicesItem(
                                          servicesModel:
                                              cubit.favoriteServicesList[index],
                                          delete: () {
                                            cubit
                                                .deleteServicesProviderToFavorite2(
                                                    id: cubit
                                                        .favoriteServicesList[
                                                            index]
                                                        .serviceId!);

                                          },
                                        ),
                                      );
                                    },
                                    itemCount:
                                        cubit.favoriteServicesList.length,
                                  )
                                : Center(
                                    child: Text(
                                      'لا توجد خدمات مفضلة',
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
