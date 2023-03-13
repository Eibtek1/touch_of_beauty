import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/constants/constants.dart';
import '../../buisness_logic/services_cubit/services_cubit.dart';
import '../../buisness_logic/services_cubit/services_state.dart';
import '../widgets/home_screen_widgets/fav_services_builder.dart';
import '../widgets/home_screen_widgets/services_bottom_sheet.dart';

class FavoritesServicesScreen extends StatefulWidget {
  const FavoritesServicesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesServicesScreen> createState() =>
      _FavoritesServicesScreenState();
}

class _FavoritesServicesScreenState extends State<FavoritesServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 22.h,
                    width: 22.w,
                    child: InkWell(onTap:(){Navigator.pop(context);},child: Icon(Icons.arrow_back_rounded,color: Colors.black,size: 24.r,)),
                  ),
                  Expanded(
                    child: Text(
                      'الخدمات المفضلة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                    width: 22.w,
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocConsumer<UserServicesCubit, UserServicesState>(
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
                  return state is! GetFavoritesServicesLoadingState
                      ? !cubit.getFavoriteServicesLoading
                          ? cubit.favoriteServicesList.isNotEmpty
                              ? ListView.builder(
                                  padding: EdgeInsets.symmetric(vertical: 3.h),
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        cubit
                                            .getServicesDetailsInCentersBottomSheetByItsId(
                                                id: cubit
                                                    .favoriteServicesList[index]
                                                    .serviceId!);
                                      },
                                      child: FavoriteServicesItem(
                                        servicesModel:
                                            cubit.favoriteServicesList[index],
                                        delete: () {
                                          cubit.deleteServicesProviderToFavorite2(
                                              id: cubit
                                                  .favoriteServicesList[index]
                                                  .serviceId!);
                                        },
                                      ),
                                    );
                                  },
                                  itemCount: cubit.favoriteServicesList.length,
                                )
                              : Center(
                                  child: Text(
                                    'لا توجد خدمات مفضلة',
                                    style: TextStyle(
                                        color: AppColorsLightTheme.primaryColor,
                                        fontFamily: FontPath.almaraiBold,
                                        fontSize: 16.sp),
                                  ),
                                )
                          : const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                      : const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
