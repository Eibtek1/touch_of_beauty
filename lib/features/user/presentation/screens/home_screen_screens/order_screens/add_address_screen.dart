import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import '../../../../../../core/assets_path/font_path.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../authentication/presentation/widgets/citeis_dropdown_button.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/home_screen_widgets/complain_text_field.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController regionController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingNumberController =
      TextEditingController();
  final TextEditingController flatNumberController = TextEditingController();
  final TextEditingController addressDetailsController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    regionController.dispose();
    streetController.dispose();
    buildingNumberController.dispose();
    flatNumberController.dispose();
    addressDetailsController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'اضافة عنوان',
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
          child: BlocConsumer<UserServicesCubit, UserServicesState>(
            listener: (context, state) {
              var cubit = UserServicesCubit.get(context);
              if(state is AddAddressSuccess){
                Navigator.pop(context);
                Navigator.pop(context);
                cubit.getAddress();
              }else if(state is AddAddressLoading){
                showProgressIndicator(context);
              }
            },
            builder: (context, state) {
              var cubit = UserServicesCubit.get(context);
              return Form(
                key: formKey,
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
                      hintText: 'المنطقة',
                      height: 44.h,
                      controller: regionController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'لا يمكن ان تكون المنطقة فارغة';
                        }else if(value.length<5){
                          return 'وصف المنطقة قصير';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CustomUserTextField(
                      hintText: 'الطريق',
                      height: 44.h,
                      controller: streetController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'لا يمكن ان يكون وصف الطريق فارغ';
                        }else if(value.length<5){
                          return 'وصف الطريق قصير';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CustomUserTextField(
                      hintText: 'رقم المبني',
                      height: 44.h,
                      controller: buildingNumberController,
                      validator: (value){
                      if(value!.isEmpty){
                        return 'لا يمكن ان يكون وصف رقم المبني فارغ';
                      }else if(value.length<5){
                        return 'وصف رقم المبني قصير';
                      }
                      return null;
                    },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CustomUserTextField(
                      hintText: 'رقم الشقة',
                      height: 44.h,
                      controller: flatNumberController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'لا يمكن ان يكون وصف رقم الشقة فارغ';
                        }else if(value.length<5){
                          return 'وصف رقم الشقة قصير';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CustomUserTextField(
                      hintText: 'وصف العنوان',
                      height: 44.h,
                      controller: addressDetailsController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'لا يمكن ان يكون وصف العنوان فارغ';
                        }else if(value.length<5){
                          return 'وصف العنوان قصير';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    const CityDropDownButton(),
                    SizedBox(
                      height: 60.h,
                    ),
                    CustomUserButton(
                        buttonTitle: 'اضافة',
                        isTapped: () {
                          if(formKey.currentState!.validate()){
                            cubit.addAddress(
                              region: regionController.text,
                              street: streetController.text,
                              buildingNumber: buildingNumberController.text,
                              flatNumber: flatNumberController.text,
                              addressDetails: addressDetailsController.text,
                            );
                          }
                        },
                        paddingVertical: 12.h,
                        paddingHorizontal: 45.w,
                        width: double.infinity),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
