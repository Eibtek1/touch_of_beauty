import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/main_cubit/main_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/main_cubit/main_state.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/custom_appbar.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/home_screen_widgets/cursol_slider_widget.dart';
import '../widgets/home_screen_widgets/favorites_services_providers_component.dart';
import '../widgets/home_screen_widgets/featured_services_providers_component.dart';
import '../widgets/home_screen_widgets/main_featured_component.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

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
                  const MainFeaturedComponent(),
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
                  const FeaturedServicesProvidersComponent(),
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
                  const FavoritesServicesProvidersComponent(),
                  SizedBox(
                    height: 15.h,
                  ),
                  // Text(
                  //   'الخدمات المفضلة',
                  //   style: TextStyle(
                  //       fontSize: 16.sp,
                  //       fontFamily: FontPath.almaraiBold,
                  //       color: const Color(0xff1E2432)),
                  // ),
                  // SizedBox(
                  //   height: 15.h,
                  // ),
                  // BlocConsumer<UserServicesCubit, UserServicesState>(
                  //   listener: (context, state) {
                  //     var cubit = UserServicesCubit.get(context);
                  //     if (state
                  //             is GetServicesDetailsInCentersBottomSheetByItsIdSuccess &&
                  //         cubit.servicesModel != null) {
                  //       Navigator.pop(context);
                  //       showBottomSheet(
                  //         context: context,
                  //         builder: (context) {
                  //           return ServicesBottomSheet(
                  //               servicesModel: cubit.servicesModel!);
                  //         },
                  //       );
                  //     }
                  //     if (state
                  //         is GetServicesDetailsInCentersBottomSheetByItsIdLoadingState) {
                  //       showProgressIndicator(context);
                  //     }
                  //   },
                  //   builder: (context, state) {
                  //     var cubit = UserServicesCubit.get(context);
                  //     return SizedBox(
                  //       height:
                  //           cubit.favoriteServicesList.isEmpty ? 40.h : 195.h,
                  //       child: !cubit.getFavoriteServicesLoading
                  //           ? cubit.favoriteServicesList.isNotEmpty
                  //               ? ListView.builder(
                  //                   padding:
                  //                       EdgeInsets.symmetric(vertical: 3.h),
                  //                   shrinkWrap: true,
                  //                   scrollDirection: Axis.horizontal,
                  //                   itemBuilder:
                  //                       (BuildContext context, int index) {
                  //                     return InkWell(
                  //                       onTap: () {
                  //                         cubit
                  //                             .getServicesDetailsInCentersBottomSheetByItsId(
                  //                                 id: cubit
                  //                                     .favoriteServicesList[
                  //                                         index]
                  //                                     .serviceId!);
                  //                       },
                  //                       child: FavoriteServicesItem(
                  //                         servicesModel:
                  //                             cubit.favoriteServicesList[index],
                  //                         delete: () {
                  //                           cubit
                  //                               .deleteServicesProviderToFavorite2(
                  //                                   id: cubit
                  //                                       .favoriteServicesList[
                  //                                           index]
                  //                                       .serviceId!);
                  //
                  //                         },
                  //                       ),
                  //                     );
                  //                   },
                  //                   itemCount:
                  //                       cubit.favoriteServicesList.length,
                  //                 )
                  //               : Center(
                  //                   child: Text(
                  //                     'لا توجد خدمات مفضلة',
                  //                     style: TextStyle(
                  //                         color:
                  //                             AppColorsLightTheme.primaryColor,
                  //                         fontFamily: FontPath.almaraiBold,
                  //                         fontSize: 16.sp),
                  //                   ),
                  //                 )
                  //           : const Center(
                  //               child: CircularProgressIndicator.adaptive(),
                  //             ),
                  //     );
                  //   },
                  // ),
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
