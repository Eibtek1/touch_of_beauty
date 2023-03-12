import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../buisness_logic/main_features_cubit/main_features_cubit.dart';
import '../../../buisness_logic/main_features_cubit/main_features_state.dart';
import '../../screens/home_screen_screens/main_featuers_services.dart';
import 'grid_item_builder.dart';

class MainFeaturedComponent extends StatefulWidget {
  const MainFeaturedComponent({Key? key}) : super(key: key);

  @override
  State<MainFeaturedComponent> createState() => _MainFeaturedComponentState();
}

class _MainFeaturedComponentState extends State<MainFeaturedComponent> {
  @override
  void initState() {
    if (MainFeaturesCubit.get(context).mainSectionsFeaturedList.isEmpty) {
      MainFeaturesCubit.get(context).getFeaturedMainSections();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainFeaturesCubit, MainFeaturesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainFeaturesCubit.get(context);
        return Column(
          children: [
            state is! GetFeaturedMainSectionsLoadingState
                ? cubit.mainSectionsFeaturedList.isNotEmpty
                    ? GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.mainSectionsFeaturedList.length > 8
                            ? 8
                            : cubit.mainSectionsFeaturedList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            cubit.servicesPageNumber = 1;
                            cubit.getServicesByMainFeaturesId(
                                mainSectionId:
                                    cubit.mainSectionsFeaturedList[index].id!);
                            Navigator.pushNamed(
                                context, ScreenName.userCategoryDetailsScreen,
                                arguments: MainFeatureServicesArgs(
                                    title: cubit
                                        .mainSectionsFeaturedList[index].title!,
                                    mainFeatureId: cubit
                                        .mainSectionsFeaturedList[index].id!));
                          },
                          child: GridItemBuilder(
                            model: cubit.mainSectionsFeaturedList[index],
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
    );
  }
}
