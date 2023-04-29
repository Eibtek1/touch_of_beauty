import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../buisness_logic/services_cubit/services_cubit.dart';
import '../../../buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import '../../../buisness_logic/services_providers_cubit/services_providers_state.dart';
import 'center_details_bottom_sheet.dart';
import 'favorite_services_provider_item_builder.dart';

class FavoritesServicesProvidersComponent extends StatefulWidget {
  const FavoritesServicesProvidersComponent({Key? key}) : super(key: key);

  @override
  State<FavoritesServicesProvidersComponent> createState() =>
      _FavoritesServicesProvidersComponentState();
}

class _FavoritesServicesProvidersComponentState
    extends State<FavoritesServicesProvidersComponent> {
  @override
  void initState() {
    if (ServicesProvidersCubit.get(context).servicesProvidersList.isEmpty) {
      ServicesProvidersCubit.get(context).getAllServicesProviders();
    }
    if (ServicesProvidersCubit.get(context)
        .favoritesServicesProvidersList
        .isEmpty) {
      ServicesProvidersCubit.get(context).getFavoritesServicesProviders();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesProvidersCubit, ServicesProvidersState>(
      buildWhen: (p, a) => p != a,
      listener: (context, state) {
        var cubit = ServicesProvidersCubit.get(context);
        if (state is GetFavoriteServicesProviderDetailsByItsIdSuccess &&
            cubit.servicesProviderModel != null) {
          Navigator.pop(context);
          UserServicesCubit.get(context).tabBarCIndex = 0;
          UserServicesCubit.get(context).changeTabBarCurrentIndex(0,
              servicesProviderId: cubit.servicesProviderModel!.id!,
              mainSectionId:
              cubit.servicesProviderModel!.mainSection!.isNotEmpty?cubit.servicesProviderModel!.mainSection![0].mainSectionId!:0,
          );
          showBottomSheet(
            context: context,
            builder: (context) => CenterDetailsBottomSheet(
              servicesProvidersModel: cubit.servicesProviderModel!,
            ),
          );
        }
        if (state is GetFavoriteServicesProviderDetailsByItsIdLoadingState) {
          showProgressIndicator(context);
        }
      },
      builder: (context, state) {
        var cubit = ServicesProvidersCubit.get(context);
        return SizedBox(
          height: cubit.favoritesServicesProvidersList.isEmpty ? 40.h : 195.h,
          child: !cubit.getFavoriteServicesProviderLoading
              ? cubit.favoritesServicesProvidersList.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.favoritesServicesProvidersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            cubit.getFavoriteServicesProviderDataByItsId(
                                id: cubit.favoritesServicesProvidersList[index]
                                    .providerId!);
                          },
                          child: FavoriteSalonItemBuilder(
                            servicesProviderModel:
                                cubit.favoritesServicesProvidersList[index],
                            delete: () {
                              cubit.deleteServicesProviderToFavorite(
                                  id: cubit
                                      .favoritesServicesProvidersList[index]
                                      .providerId!);
                            },
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        LocaleKeys.no_fav_centers.tr(),
                        style: TextStyle(
                            color: AppColorsLightTheme.primaryColor,
                            fontFamily: FontPath.almaraiBold,
                            fontSize: 16.sp),
                      ),
                    )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
        );
      },
    );
  }
}
