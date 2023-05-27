import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/custom_button.dart';

import '../../../../../../core/app_router/screens_name.dart';
import '../../../../../../core/app_theme/light_theme.dart';
import '../../../../../../core/assets_path/font_path.dart';
import '../../../../../../translations/locale_keys.g.dart';
import '../../../../../vendor/buisness_logic/employees_cubit/employees_cubit.dart';
import '../../../../buisness_logic/services_cubit/services_cubit.dart';
import '../../../../buisness_logic/services_cubit/services_state.dart';
import '../../../widgets/calender_widget.dart';
import '../../../widgets/center_employee_widget.dart';
import '../../../widgets/home_screen_widgets/order_item_widget.dart';
class ReserveOrderScreenArguments{
  final dynamic servicesModel;
  final bool isFav;
  final bool isBottomSheet;

  ReserveOrderScreenArguments({this.servicesModel, this.isFav = false ,this.isBottomSheet = false, });
}
class ReserveOrderScreen extends StatefulWidget {
  const ReserveOrderScreen({Key? key, required this.servicesModel, required this.isFav, this.isBottomSheet =false}) : super(key: key);

  final dynamic servicesModel;
  final bool isFav;
  final bool isBottomSheet;

  @override
  State<ReserveOrderScreen> createState() => _ReserveOrderScreenState();
}

class _ReserveOrderScreenState extends State<ReserveOrderScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    EmployeesCubit.get(context).getEmployeeForCenterToUser(providerId:widget.servicesModel.serviceProvider?.id??"");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          LocaleKeys.service_reservation.tr(),
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
          if (state is AddOrderSuccess) {
            Navigator.pop(context);
            Navigator.pop(context);
            Fluttertoast.showToast(
              msg: LocaleKeys.your_request_added.tr(),
              gravity: ToastGravity.CENTER,
              backgroundColor: AppColorsLightTheme.primaryColor,
              textColor: Colors.white,
            );
            cubit.addressModel = null;
            cubit.dateTime = null;
          }else if(state is AddOrderLoading){
            showProgressIndicator(context);
          }
        },
        builder: (context, state) {
          var cubit = UserServicesCubit.get(context);
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            children: [
              SizedBox(
                height: 5.h,
              ),
              const Divider(),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ScreenName.chooseAddressScreen);
                },
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
                      cubit.addressModel == null
                          ? LocaleKeys.please_select_address.tr()
                          : LocaleKeys.change_address.tr(),
                      style: TextStyle(
                          color: const Color(0xff263238),
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 12.sp),
                    ),
                    const Spacer(),
                    Text(
                      cubit.addressModel == null
                          ? ''
                          : cubit.addressModel!.region!,
                      style: TextStyle(
                          color: AppColorsLightTheme.searchScreenTextColor,
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              const Divider(),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.your_reservation.tr(),
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                ],
              ),
              OrderItemWidget(
                servicesModel: widget.servicesModel,
                isBottomSheet: widget.isBottomSheet,
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () async{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectDate(providerId: widget.servicesModel.serviceProvider?.id??"",)));
                    },
                child: Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      size: 20.r,
                      color: const Color(0xffB83561),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      cubit.dateTime == null
                          ? LocaleKeys.please_select_time.tr()
                          : LocaleKeys.change_time.tr(),
                      style: TextStyle(
                          color: const Color(0xff263238),
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 12.sp),
                    ),
                    const Spacer(),
                    Text(
                      cubit.dateTime == null
                          ? ''
                          : Jiffy(cubit.dateTime).yMMMdjm.toString(),
                      style: TextStyle(
                          color: AppColorsLightTheme.searchScreenTextColor,
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              const Divider(),
              Text(
                LocaleKeys.services_type.tr(),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: FontPath.almaraiBold,
                    color: const Color(0xff1E2432)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (widget.servicesModel.inHome == true &&
                          widget.servicesModel.inCenter == true) {
                        cubit.changeButtonState(onPressed: () {
                          cubit.reserveOrderStatusInHome =
                              !cubit.reserveOrderStatusInHome;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: cubit.reserveOrderStatusInHome
                            ? AppColorsLightTheme.primaryColor
                            : AppColorsLightTheme.authTextFieldFillColor,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        shape: const StadiumBorder()),
                    child: Text(
                      cubit.reserveOrderStatusInHome
                          ? LocaleKeys.services_in_home.tr()
                          : LocaleKeys.services_in_center.tr(),
                      style: TextStyle(
                          color: cubit.reserveOrderStatusInHome
                              ? Colors.white
                              : Colors.grey,
                          fontFamily: FontPath.almaraiRegular,
                          fontSize: 12.sp),
                    ),
                  ),
                  SizedBox(
                    width: 90.w,
                  ),
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              Text(
                LocaleKeys.center_employees.tr(),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: FontPath.almaraiBold,
                    color: const Color(0xff1E2432)),
              ),
              SizedBox(
                height: 14.h,
              ),
              const EmployeesComponentBuilderForUser(),
              Text(
                LocaleKeys.reserve_time.tr(),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: FontPath.almaraiBold,
                    color: const Color(0xff1E2432)),
              ),
              SizedBox(
                height: 26.h,
              ),
              SizedBox(
                height: 95.h,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          LocaleKeys.service_cost.tr(),
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff1E2432)),
                        ),
                        Text(
                          '${widget.servicesModel.finalPrice}  رس',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: FontPath.almaraiRegular,
                            color: const Color(0xffB83561),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45.h,
                      child: CustomUserButton(
                        buttonTitle: LocaleKeys.order_now.tr(),
                        isTapped: () {
                          if (cubit.dateTime == null) {
                            Fluttertoast.showToast(
                              msg: LocaleKeys.please_select_date.tr(),
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          } else if (cubit.addressModel == null) {
                            Fluttertoast.showToast(
                              msg: LocaleKeys.please_select_address.tr(),
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          } else {
                            cubit.addOrder(
                                serviceId: widget.isFav?widget.servicesModel.serviceId:widget.servicesModel.id!,
                                addressId: cubit.addressModel!.id!,
                                dateTime: cubit.dateTime!.toIso8601String(),
                                inHome: cubit.reserveOrderStatusInHome);
                          }
                        },
                        width: 124.w,
                        paddingVertical: 0,
                        paddingHorizontal: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget availableTimeWidget({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: const Color(0xff263238),
              fontFamily: FontPath.almaraiBold,
              fontSize: 16.sp),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 24.h,
              width: 81.w,
              decoration: BoxDecoration(
                color: const Color(0xffF0F3F6),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  '20.00 - 16.00',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontPath.almaraiRegular,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 24.h,
              width: 81.w,
              decoration: BoxDecoration(
                color: const Color(0xffF0F3F6),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  '20.00 - 16.00',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontPath.almaraiRegular,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
