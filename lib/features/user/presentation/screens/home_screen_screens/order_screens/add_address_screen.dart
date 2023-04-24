import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import 'package:touch_of_beauty/features/user/data/models/address_model.dart';
import '../../../../../../core/assets_path/font_path.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/dropdown_button.dart';
import '../../../widgets/home_screen_widgets/complain_text_field.dart';

class AddAddressArgs {
  final AddressModel? addressModel;
  final int? userEqualsZeroVendorEqualsOne;

  AddAddressArgs({this.addressModel, this.userEqualsZeroVendorEqualsOne});
}

class AddAddressScreen extends StatefulWidget {
  final AddressModel? addressModel;
  final int userEqualsZeroVendorEqualsOne;

  const AddAddressScreen(
      {Key? key,
      this.addressModel,
      required this.userEqualsZeroVendorEqualsOne})
      : super(key: key);

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
  void initState() {
    if (widget.userEqualsZeroVendorEqualsOne == 1) {
      regionController.text = widget.addressModel?.region ?? '';
      streetController.text = widget.addressModel?.street ?? '';
      buildingNumberController.text = widget.addressModel?.buildingNumber
              ?.replaceAll(RegExp(r'[^0-9]'), '') ??
          "";
      flatNumberController.text =
          widget.addressModel?.flatNumber?.replaceAll(RegExp(r'[^0-9]'), '') ??
              '';
      addressDetailsController.text = widget.addressModel?.addressDetails ?? "";
    }
    super.initState();
  }

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
    return BlocConsumer<UserServicesCubit, UserServicesState>(
      listener: (context, state) {
        var cubit = UserServicesCubit.get(context);
        if (state is AddAddressSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          cubit.getAddress();
        } else if (state is AddAddressLoading) {
          showProgressIndicator(context);
        }
        if (state is UpdateAddressSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          cubit.getAddress();
        } else if (state is UpdateAddressLoading) {
          showProgressIndicator(context);
        }
      },
      builder: (context, state) {
        var cubit = UserServicesCubit.get(context);
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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'المنطقة',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff8B8989),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomUserTextField(
                      hintText: 'المنطقة',
                      height: 44.h,
                      controller: regionController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لا يمكن ان تكون المنطقة فارغة';
                        } else if (value.length < 5) {
                          return 'وصف المنطقة قصير';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      'الطريق',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff8B8989),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomUserTextField(
                      hintText: 'الطريق',
                      height: 44.h,
                      controller: streetController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لا يمكن ان يكون وصف الطريق فارغ';
                        } else if (value.length < 5) {
                          return 'وصف الطريق قصير';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      'رقم المبني',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff8B8989),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomUserTextField(
                      hintText: 'رقم المبني',
                      keyboardType: TextInputType.phone,
                      height: 44.h,
                      controller: buildingNumberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لا يمكن ان يكون وصف رقم المبني فارغ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      'رقم الشقة',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff8B8989),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomUserTextField(
                      hintText: 'رقم الشقة',
                      height: 44.h,
                      controller: flatNumberController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لا يمكن ان يكون وصف رقم الشقة فارغ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      'وصف العنوان',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff8B8989),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomUserTextField(
                      hintText: 'وصف العنوان',
                      height: 44.h,
                      controller: addressDetailsController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لا يمكن ان يكون وصف العنوان فارغ';
                        } else if (value.length < 5) {
                          return 'وصف العنوان قصير';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      'المدينة',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff8B8989),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CityDropDownButton(
                        userEqualsZeroVendorEqualsOne:
                            widget.addressModel?.cityId),
                    SizedBox(
                      height: 60.h,
                    ),
                    CustomUserButton(
                      buttonTitle: widget.addressModel!=null?"تعديل":'اضافة',
                      isTapped: () {
                        if (formKey.currentState!.validate()) {
                          if (widget.addressModel == null) {
                            cubit.addAddress(
                              region: regionController.text,
                              street: streetController.text,
                              buildingNumber: buildingNumberController.text,
                              flatNumber: flatNumberController.text,
                              addressDetails: addressDetailsController.text,
                            );
                          } else {
                            cubit.updateAddress(
                              region: regionController.text,
                              street: streetController.text,
                              buildingNumber: buildingNumberController.text,
                              flatNumber: flatNumberController.text,
                              addressDetails: addressDetailsController.text, addressId: widget.addressModel!.id!,
                            );
                          }
                        }
                      },
                      paddingVertical: 12.h,
                      paddingHorizontal: 45.w,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
