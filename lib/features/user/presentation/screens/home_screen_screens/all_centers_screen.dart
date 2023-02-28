import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_providers_cubit/services_providers_state.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/svg_path.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/home_screen_widgets/all_centers_item.dart';
import '../../widgets/home_screen_widgets/center_details_bottom_sheet.dart';

class AllCentersScreen extends StatefulWidget {
  const AllCentersScreen({Key? key}) : super(key: key);

  @override
  State<AllCentersScreen> createState() => _AllCentersScreenState();
}

class _AllCentersScreenState extends State<AllCentersScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    ServicesProvidersCubit.get(context).getAllServicesProviders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'مراكز الخدمة',
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
      body: BlocConsumer<ServicesProvidersCubit, ServicesProvidersState>(
        listener: (context, state){
          var cubit = ServicesProvidersCubit.get(context);
          if(state is GetServicesProviderDetailsByItsIdSuccess&&cubit.servicesProviderModel!=null){
            Navigator.pop(context);
            showBottomSheet(
              context: context,
              builder: (context) => CenterDetailsBottomSheet(
                servicesProvidersModel: cubit.servicesProviderModel!,
              ),
            );
          }
          if(state is GetServicesProviderDetailsByItsIdLoadingState){
            showProgressIndicator(context);
          }
        },
        builder: (context, state) {
          var cubit = ServicesProvidersCubit.get(context);
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                        child: SearchBarWidget(width: double.infinity, color: AppColorsLightTheme.authTextFieldFillColor, controller: searchController)),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: AppColorsLightTheme.secondaryColor
                              .withOpacity(0.2),
                          shape: BoxShape.circle),
                      child: Center(
                        child: SvgPicture.asset(SvgPath.settingsSliders),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Divider(),
              Expanded(
                child: state is! GetAllServicesProvidersLoadingState
                    ? ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              cubit.getServicesProviderDataByItsId(id: cubit.servicesProvidersList[index].id!);
                            },
                            child: AllCentersItemBuilder(
                              servicesProviderModel:
                                  cubit.servicesProvidersList[index],
                            ),
                          );
                        },
                        itemCount:
                        cubit.servicesProvidersList.length,
                      )
                    : const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
              )
            ],
          );
        },
      ),
    );
  }
}
