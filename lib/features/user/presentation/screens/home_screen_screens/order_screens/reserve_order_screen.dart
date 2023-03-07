import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          // TODO: implement listener
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
                      'الرجاء اختيار عنوانك',
                      style: TextStyle(
                          color: const Color(0xff263238),
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 12.sp),
                    ),
                    const Spacer(),
                    Text(
                      '202020',
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
              OrderItemWidget(servicesModel: servicesModel,),
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
                    initialDate: cubit.dateTime,
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
                    cubit.changeButtonState(onPressed: (){
                      cubit.dateTime =value!;
                    });
                  }).catchError((error){
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
                      'الرجاء اختيار التوقيت',
                      style: TextStyle(
                          color: const Color(0xff263238),
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 12.sp),
                    ),
                    const Spacer(),
                    Text(
                      '202020',
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
                      if(servicesModel.inHome == true&&servicesModel.inCenter== true){
                        cubit.changeButtonState(onPressed: (){
                          cubit.reserveOrderStatusInHome = !cubit.reserveOrderStatusInHome;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                        cubit.reserveOrderStatusInHome
                            ? AppColorsLightTheme.primaryColor
                            : AppColorsLightTheme
                            .authTextFieldFillColor,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        shape: const StadiumBorder()),
                    child: Text(
                      cubit.reserveOrderStatusInHome?'الخدمة بالمنزل':'الخدمة بالمركز',
                      style: TextStyle(
                          color:
                          cubit.reserveOrderStatusInHome
                              ? Colors.white
                              : Colors.grey,
                          fontFamily: FontPath.almaraiRegular,
                          fontSize: 12.sp),
                    ),
                  ),
                  SizedBox(width: 90.w,),
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
                              border: Border.all(
                                  color: Colors.grey, width: 0.9.w),
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
                          Navigator.pushNamed(
                              context, ScreenName.addAddressScreen);
                        },
                        width: 124.w,
                        paddingVertical: 0,
                        paddingHorizontal: 0,
                      ),),
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
