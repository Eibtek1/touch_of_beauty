import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/services_bottom_sheet.dart';
import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/constants/constants.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/home_screen_widgets/center_services_item.dart';

class OurServicesScreen extends StatefulWidget {
  final dynamic id;

  const OurServicesScreen({Key? key, this.id}) : super(key: key);

  @override
  State<OurServicesScreen> createState() => _OurServicesScreenState();
}

class _OurServicesScreenState extends State<OurServicesScreen> {
  final TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if(BlocProvider.of<UserServicesCubit>(context).searchList.isEmpty){
          BlocProvider.of<UserServicesCubit>(context)
              .getServicesByServiceProviderId(servicesProviderId: widget.id);
        }else{
          BlocProvider.of<UserServicesCubit>(context)
              .searchForServicesOfServicesProviderByItsId(servicesProviderId: widget.id,searchName: searchController.text);
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'خدماتنا',
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
        body: BlocConsumer<UserServicesCubit, UserServicesState>(
          listener: (context, state) {
            var cubit = UserServicesCubit.get(context);
            if(state is GetServicesByServiceProviderIdSuccess && cubit.searchList.isEmpty&& cubit.servicesList.isNotEmpty&&searchController.text.isNotEmpty){
              searchController.clear();
              Fluttertoast.showToast(msg: 'لا تتوفر عناصر البحث',gravity: ToastGravity.CENTER);
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
            var cubit = UserServicesCubit.get(context);
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
                                servicesProviderId: widget.id,
                                searchName: searchController.text);
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
                              context, ScreenName.userSearchScreen,
                              arguments:
                                  cubit.servicesList[0].serviceProvider!.id);
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20.r,
                        color: const Color(0xffB83561),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'الرجاء اختيار عنوانك',
                        style: TextStyle(
                            color: const Color(0xff263238),
                            fontFamily: FontPath.almaraiBold,
                            fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: state is! GetServicesByServiceProviderIdLoading
                      ? ListView.builder(
                          controller: scrollController,
                          itemCount: cubit.searchList.isNotEmpty?cubit.searchList.length:cubit.servicesList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 20.w),
                              child: InkWell(
                                  onTap: () {
                                    cubit.getServicesDetailsByItsId(id: cubit.searchList.isNotEmpty?cubit.searchList[index].id!:cubit.servicesList[index].id!);
                                  },
                                  child: CenterServicesCategoryItem(
                                    servicesModel: cubit.searchList.isNotEmpty?cubit.searchList[index]:cubit.servicesList[index],
                                  ),),
                            );
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
