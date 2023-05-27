import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/cache_manager/cache_keys.dart';
import 'package:touch_of_beauty/core/cache_manager/shared_preferences.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../freelancer/presentation/widgets/custom_vendor_button.dart';
import '../../../buisness_logic/employees_cubit/employees_cubit.dart';
import '../../../buisness_logic/employees_cubit/employees_state.dart';
import 'custo_text_form_field.dart';

class EmployeeAlertDialog extends StatefulWidget {
  const EmployeeAlertDialog({Key? key}) : super(key: key);

  @override
  State<EmployeeAlertDialog> createState() => _EmployeeAlertDialogState();
}

class _EmployeeAlertDialogState extends State<EmployeeAlertDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 430.h,
        child: BlocConsumer<EmployeesCubit, EmployeesState>(
          listener: (context, state) {
            if (state is AddEmployeeSuccess) {
              var cubit = EmployeesCubit.get(context);
              cubit.profileImage = null;
              cubit.getEmployee();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            var cubit = EmployeesCubit.get(context);
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      cubit.getImagePick();
                    },
                    child: Container(
                      height: 68.h,
                      width: 68.w,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              color: Colors.black.withOpacity(0.28),
                              blurRadius: 8.r,
                            )
                          ],
                          color: Colors.white),
                      child:cubit.profileImage ==null? Center(
                        child: Icon(
                          Icons.add,
                          color: AppColorsLightTheme.primaryColor,
                          size: 28.r,
                        ),
                      ):Image.file(cubit.profileImage!,fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  CustomTextFormField(
                    height: 44.h,
                    width: double.infinity,
                    controller: nameController,
                    hintText: LocaleKeys.name.tr(),
                    validator: (value){
                      initialLocale = CacheHelper.getData(key: CacheKeys.initialLocale)??"ar";
                      if(value!.isEmpty){
                        return LocaleKeys.short_name.tr();
                      }else if(value.length<5){
                        return initialLocale == 'ar'?"يجب ان يكون الاسم اكبر من خمسة احرف":"Name should be more than five characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15.h,),
                  CustomTextFormField(
                    height: 44.h,
                    width: double.infinity,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    hintText: LocaleKeys.phone_number.tr(),
                    validator: (value){
                      var regex = RegExp(r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$');
                      if (value!.isEmpty) {
                        return LocaleKeys.enter_your_phone.tr();
                      }
                      else if (!regex.hasMatch(value)) {
                        return LocaleKeys.valid_phone_number.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15.h,),
                  CustomTextFormField(
                    height: 44.h,
                    width: double.infinity,
                    controller: emailController,
                    hintText: LocaleKeys.email.tr(),
                    validator: (value){
                      if(value!.isEmpty){
                        return LocaleKeys.enter_email.tr();
                      }else if(!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)){
                        return LocaleKeys.incorrect_email.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h,),
                  state is! AddEmployeeLoading
                      ? CustomVendorButton(
                      buttonTitle: LocaleKeys.add.tr(),
                      isTapped: () {
                        if(cubit.profileImage == null){
                          Fluttertoast.showToast(msg: LocaleKeys.please_choose_image.tr());
                        }else if(formKey.currentState!.validate()){
                          cubit.addEmployee(name: nameController.text, email: emailController.text, phoneNumber: phoneController.text,);
                        }
                      },
                      width: double.infinity,
                      paddingVertical: 12.h,
                      paddingHorizontal: 45.w)
                      : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
