// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TryAWidget extends StatelessWidget {
  const TryAWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
            height: 6.h,
            width: 303.w,
            child: const CustomTimerProgress(
              maxTime: 60,
              minTime: 35,
              containerWidth: 303,
              progressColor: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTimerProgress extends StatelessWidget {
  final double maxTime;
  final double minTime;
  final double containerWidth;
  final Color progressColor;

  const CustomTimerProgress(
      {super.key,
      required this.maxTime,
      required this.minTime,
      required this.containerWidth,
      required this.progressColor});

  @override
  Widget build(context) {
    return Stack(
      children: [
        Container(
          height: 6.h,
          width: double.infinity,
          color: Colors.grey.shade300,
        ),
        Container(
          height: 6.h,
          width: minTime == maxTime
              ? double.infinity
              : minTime < maxTime
                  ? (containerWidth * (minTime / maxTime)).w
                  : 1.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white54,
                progressColor,
              ],
              end: Alignment.centerRight,
              begin: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }
}


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // resizeToAvoidBottomInset: false,

      body: ListView(
        // reverse: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(right: 20.w,left: 20.w,top: 70.h),
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logoP.png'),
                const Text('دقائق قرانية',style: TextStyle(fontFamily: 'noto',fontSize: 22,fontWeight: FontWeight.bold,color: Colors.grey),),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomTextField(
            controller: emailController,
            inputType: TextInputType.name,
            hint: 'الإسم بالكامل',
            icon: const Icon(Icons.person,color: Colors.white,),
            validator: (val){
              if(val == null || val.isEmpty){
                return 'ادخل اسمك';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            controller: emailController,
            inputType: TextInputType.emailAddress,
            hint: 'الإيميل',
            icon: const Icon(Icons.email,color: Colors.white,),
            validator: (val){
              if(val == null || val.isEmpty){
                return 'ادخل الايميل الخاص بك';
              } else if(!val.contains('@')){
                return 'ادخل الايميل بشكل صحيح';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            controller: passwordController,
            inputType: TextInputType.visiblePassword,
            hint: 'كلمة المرور',
            icon: const Icon(Icons.visibility,color: Colors.white,),
            validator: (val){
              if(val == null || val.isEmpty){
                return 'ادخل كلمة المرور الخاصة بك';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            controller: rePasswordController,
            inputType: TextInputType.visiblePassword,
            hint: 'اعد كتابة كلمة المرور',
            icon: const Icon(Icons.visibility,color: Colors.white,),
            validator: (val){
              if(val == null || val.isEmpty){
                return 'ادخل كلمة المرور الخاصة بك';
              } else if(passwordController.text != rePasswordController.text){
                return 'كلمة المرور غير متطابقة';
              }
              return null;
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 120.h,
            width: 120.w,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(18.0),
            child: const Text('تسجيل',style:  TextStyle(fontFamily: 'noto',color: Colors.white),),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: (){
                    // Get.to(()=> LoginScreen());
                  },
                  child: const Text('سجل دخولك الان',style:  TextStyle(fontFamily: 'noto',color: Colors.white),)),
              SizedBox(
                width: 5.w,
              ),
              const Text('لديك حساب ؟',style:  TextStyle(fontFamily: 'noto',color: Colors.white),),

            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,required this.controller,required this.hint,required this.icon,required this.inputType,required this.validator});
  TextEditingController controller = TextEditingController();
  TextInputType inputType;
  String hint;
  Widget icon;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      keyboardType: inputType,
      validator: validator,
      style: const TextStyle(fontFamily: 'noto',color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
        hintStyle: const TextStyle(fontFamily: 'noto',color: Colors.white),
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),

      ),
    );
  }
}