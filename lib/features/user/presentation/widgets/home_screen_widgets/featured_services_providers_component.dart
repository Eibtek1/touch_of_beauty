import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/salon_item.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../translations/locale_keys.g.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/constants/constants.dart';
import '../../../buisness_logic/services_cubit/services_cubit.dart';
import '../../../buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import '../../../buisness_logic/services_providers_cubit/services_providers_state.dart';
import 'center_details_bottom_sheet.dart';

class FeaturedServicesProvidersComponent extends StatefulWidget {
  const FeaturedServicesProvidersComponent({Key? key}) : super(key: key);

  @override
  State<FeaturedServicesProvidersComponent> createState() => _FeaturedServicesProvidersComponentState();
}

class _FeaturedServicesProvidersComponentState extends State<FeaturedServicesProvidersComponent> {
  @override
  void initState() {
    if (ServicesProvidersCubit.get(context)
        .featuredServicesProvidersList
        .isEmpty) {
      ServicesProvidersCubit.get(context).getFeaturedServicesProviders();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesProvidersCubit, ServicesProvidersState>(
      buildWhen: (p, c) => p != c,
      listener: (context, state) {
        var cubit = ServicesProvidersCubit.get(context);
        if (state
        is GetFeaturedServicesProviderDetailsByItsIdSuccess && cubit.servicesProviderModel != null) {
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
            padding: EdgeInsets.symmetric(vertical: 3.h),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: cubit
                .featuredServicesProvidersList.length,
            itemBuilder:
                (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  cubit.getFeaturedServicesProviderDataByItsId(
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
              LocaleKeys.no_feat_centers.tr(),
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
    );
  }
}
