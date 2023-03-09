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
import '../../../../../../core/assets_path/images_path.dart';
import '../../../../buisness_logic/services_cubit/services_cubit.dart';
import '../../../../buisness_logic/services_cubit/services_state.dart';
import '../../../../data/models/services_model.dart';
import '../../../widgets/home_screen_widgets/order_item_widget.dart';

class ReserveOrderScreen extends StatelessWidget {
  ReserveOrderScreen({Key? key, required this.servicesModel}) : super(key: key);
  final List<Map<String, dynamic>> itemsList = [
    {'image': ImagePath.babyCare, 'title': "سارة"},
    {'image': ImagePath.beautyCenter, 'title': "فاتن"},
    {'image': ImagePath.hairCare, 'title': "هند"},
    {'image': ImagePath.makeup, 'title': "هدي"},
    {'image': ImagePath.naturalTherapy, 'title': "حنان"},
    {'image': ImagePath.photography, 'title': "هاله"},
    {'image': ImagePath.selfCare, 'title': "اميره"},
    {'image': ImagePath.skinCare, 'title': "سعاد"},
  ];
  final ServicesModel servicesModel;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'حجز الخدمة',
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
              msg: 'تمت اضافة طلبك',
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
                          ? 'الرجاء اختيار عنوانك'
                          : 'تغيير عنوانك',
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
                    'طلب خدمتك',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, ScreenName.allCentersScreen);
                  //   },
                  //   child: Text(
                  //     'اضافة المزيد',
                  //     style: TextStyle(
                  //         fontSize: 16.sp,
                  //         fontFamily: FontPath.almaraiBold,
                  //         color: AppColorsLightTheme.secondaryColor),
                  //   ),
                  // ),
                ],
              ),
              OrderItemWidget(
                servicesModel: servicesModel,
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: cubit.dateTime ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2024),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData().copyWith(
                          colorScheme: const ColorScheme.light(
                              primary: AppColorsLightTheme.primaryColor,
                              secondary: Colors.white),
                          dialogBackgroundColor: Colors.white,
                        ),
                        child: child!,
                      );
                    },
                  ).then((value) {
                    cubit.changeButtonState(onPressed: () {
                      cubit.dateTime = value!;
                    });
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(
                          hour: cubit.dateTime!.hour,
                          minute: cubit.dateTime!.minute),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData().copyWith(
                            colorScheme: const ColorScheme.light(
                                primary: AppColorsLightTheme.primaryColor,
                                secondary: Colors.white),
                            dialogBackgroundColor: Colors.white,
                          ),
                          child: child!,
                        );
                      },
                    ).then((value) {
                      cubit.changeButtonState(onPressed: () {
                        cubit.dateTime = DateTime(
                            cubit.dateTime!.year,
                            cubit.dateTime!.month,
                            cubit.dateTime!.day,
                            value!.hour,
                            value.minute);
                      });
                    }).catchError((error) {
                      return;
                    });
                  }).catchError((error) {
                    return;
                  });
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
                          ? 'الرجاء اختيار التوقيت'
                          : 'تغيير التوقيت',
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
                'نوع الخدمة',
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
                      if (servicesModel.inHome == true &&
                          servicesModel.inCenter == true) {
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
                          ? 'الخدمة بالمنزل'
                          : 'الخدمة بالمركز',
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
                'عاملين المركز',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: FontPath.almaraiBold,
                    color: const Color(0xff1E2432)),
              ),
              SizedBox(
                height: 14.h,
              ),
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: 71.h,
                          width: 71.w,
                          padding: EdgeInsets.all(2.r),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 0.9.w),
                              shape: BoxShape.circle),
                          child: Image.asset(itemsList[index]['image']),
                        ),
                        Text(itemsList[index]['title'],
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: FontPath.almaraiBold,
                                color: index != 0
                                    ? const Color(0xff1E2432)
                                    : const Color(0xffB83561)))
                      ],
                    );
                  },
                ),
              ),
              Text(
                'حجز الموعد',
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
                          'تكلفة الخدمة',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff1E2432)),
                        ),
                        Text(
                          '${servicesModel.finalPrice}  رس',
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
                        buttonTitle: 'اطلب الان',
                        isTapped: () {
                          if (cubit.dateTime == null) {
                            Fluttertoast.showToast(
                              msg: 'برجاء اختيار التاريخ',
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          } else if (cubit.addressModel == null) {
                            Fluttertoast.showToast(
                              msg: 'برجاء اختيار العنوان',
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          } else {
                            cubit.addOrder(
                                serviceId: servicesModel.id!,
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
