import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import '../../../../../../core/assets_path/font_path.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/home_screen_widgets/complain_text_field.dart';

class ChooseAddressScreen extends StatelessWidget {
  const ChooseAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'تحديد العنوان',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              const Divider(),
              SizedBox(
                height: 30.h,
              ),
              CustomUserTextField(
                hintText: 'المدينة',
                height: 44.h,
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomUserTextField(
                hintText: 'المنطقة',
                height: 44.h,
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomUserTextField(
                hintText: 'اسم الشارع',
                height: 44.h,
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomUserTextField(
                hintText: 'رقم المبني',
                height: 44.h,
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomUserTextField(
                hintText: 'رقم الطابق',
                height: 44.h,
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomUserTextField(
                keyboardType: TextInputType.phone,
                hintText: 'رقم الهاتف',
                height: 44.h,
              ),
              SizedBox(
                height: 60.h,
              ),
              CustomUserButton(
                  buttonTitle: 'تأكيد الطلب',
                  isTapped: () {
                    Navigator.pushNamed(context, ScreenName.orderDetailsScreen);
                  },paddingVertical: 16.h, paddingHorizontal: 45.w,
                  width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }
}
