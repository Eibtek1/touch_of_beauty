import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/freelancer/buisness_logic/services_cubit/freelancer_services_cubit.dart';
import 'package:touch_of_beauty/features/user/data/models/services_model.dart';
import 'package:touch_of_beauty/features/vendor/buisness_logic/services_cubit/vendor_services_cubit.dart';
import 'package:touch_of_beauty/features/vendor/buisness_logic/services_cubit/vendor_services_state.dart';
import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/svg_path.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../freelancer/presentation/widgets/custom_vendor_button.dart';
import '../../widgets/center_details/custo_text_form_field.dart';
import '../../widgets/main_section_drop_down.dart';
import '../../widgets/screen_layout_widget_with_logo.dart';

class AddToServicesArguments {
  final ServicesDetailsModel? servicesModel;
  final int type;

  AddToServicesArguments({required this.servicesModel, required this.type});
}

class AddServicesScreen extends StatefulWidget {
  final ServicesDetailsModel? servicesModel;
  final int type;

  const AddServicesScreen({Key? key, this.servicesModel, required this.type})
      : super(key: key);

  @override
  State<AddServicesScreen> createState() => _AddServicesScreenState();
}

class _AddServicesScreenState extends State<AddServicesScreen> {
  final TextEditingController timeController = TextEditingController();
  final TextEditingController aNameController = TextEditingController();
  final TextEditingController eNameController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController finalPriceController = TextEditingController();
  final TextEditingController emNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool? isServicesAvailable;
  @override
  void dispose() {
    aNameController.dispose();
    eNameController.dispose();
    detailsController.dispose();
    timeController.dispose();
    priceController.dispose();
    finalPriceController.dispose();
    emNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    aNameController.text = widget.servicesModel?.titleAr ?? '';
    eNameController.text = widget.servicesModel?.titleEn ?? '';
    detailsController.text = widget.servicesModel?.description ?? '';
    priceController.text = widget.servicesModel?.price.toString() ?? '';
    finalPriceController.text =
        widget.servicesModel?.finalPrice.toString() ?? '';
    emNumberController.text =
        widget.servicesModel?.employeesNumber.toString() ?? '';
    isServicesAvailable = widget.servicesModel?.isAvailable??false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VendorServicesCubit, VendorServicesState>(
      listener: (context, state) {
        var cubit = VendorServicesCubit.get(context);
        if (state is AddServicesSuccess) {
          Navigator.pop(context);
          cubit.servicesPageNumber = 1;
          cubit.servicesImage = null;
          cubit.getServicesByServiceProviderId();
          Navigator.pop(context);
            FreelancerServicesCubit.get(context).servicesPageNumber = 1;
            // cubit.servicesImage = null;
            FreelancerServicesCubit.get(context)
                .getServicesByServiceProviderId();

        }
        else if (state is AddServicesLoading) {
          showProgressIndicator(context);
        } else if (state is AddServicesError) {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: LocaleKeys.data_validation.tr());
        }
        else if(state is DeleteServicesLoadingState){
          showProgressIndicator(context);
        }else if(state is DeleteServicesSuccess){
          Navigator.pop(context);
          cubit.servicesPageNumber = 1;
          cubit.servicesImage = null;
          cubit.getServicesByServiceProviderId();
          Navigator.pop(context);
          FreelancerServicesCubit.get(context).servicesPageNumber = 1;
          // cubit.servicesImage = null;
          FreelancerServicesCubit.get(context)
              .getServicesByServiceProviderId();
        }
      },
      builder: (context, state) {
        var cubit = VendorServicesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColorsLightTheme.primaryColor,
            foregroundColor: Colors.white,
            toolbarHeight: 60.h,
            centerTitle: true,
            title: Text(
              LocaleKeys.add_new_services.tr(),
              style: TextStyle(
                fontSize: 17.sp,
                fontFamily: FontPath.almaraiBold,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, ScreenName.vendorNotificationScreen);
                },
                icon: SvgPicture.asset(
                  SvgPath.notificationBill,
                  width: 23.w,
                  height: 28.h,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
            ],
          ),
          body: BackgroundScreenWithLogoWidget(
            firstContainerBackgroundHeight: 58.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 130.h,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Text(
                            LocaleKeys.service_picture.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff3C475C),
                            ),
                          ),
                          SizedBox(
                            height: 11.h,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 147.h,
                                width: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5.r),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 0),
                                      color: Colors.black.withOpacity(0.14),
                                      blurRadius: 10.r,
                                    )
                                  ],
                                ),
                                child: cubit.servicesImage != null
                                    ? Image.file(
                                        cubit.servicesImage!,
                                        fit: BoxFit.cover,
                                      )
                                    : widget.servicesModel != null
                                        ? CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                '${EndPoints.imageBaseUrl}${cubit.servicesModel!.imgUrl}',
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: Colors.grey[400]!,
                                              highlightColor: Colors.grey[300]!,
                                              child: Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          )
                                        : null,
                              ),
                              IconButton(
                                onPressed: () {
                                  cubit.getImagePick();
                                },
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 32.r,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            LocaleKeys.arabic_title.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff3C475C),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            height: 44.h,
                            width: double.infinity,
                            controller: aNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.arabic_title_val1.tr();
                              } else if (value.length < 5) {
                                return LocaleKeys.arabic_title_val2.tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            LocaleKeys.english_title.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff3C475C),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            height: 44.h,
                            width: double.infinity,
                            controller: eNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.english_title_val1.tr();
                              } else if (value.length < 5) {
                                return LocaleKeys.english_title_val2.tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            LocaleKeys.services_discription.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff3C475C),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            isDetails: true,
                            height: 190.h,
                            width: double.infinity,
                            controller: detailsController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.service_details_val1.tr();
                              } else if (value.length < 5) {
                                return LocaleKeys.service_details_val2.tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          // if (widget.servicesModel == null)
                            Text(
                              LocaleKeys.service_duration.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff3C475C),
                            ),
                          ),
                          // if (widget.servicesModel == null)
                            SizedBox(
                              height: 5.h,
                            ),
                          // if (widget.servicesModel == null)
                            CustomTextFormField(
                              keyboardType: TextInputType.phone,
                              height: 44.h,
                              width: double.infinity,
                              controller: timeController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LocaleKeys.enter_the_duration.tr();
                                }
                                return null;
                              },
                            ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            LocaleKeys.service_cost.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff3C475C),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            height: 44.h,
                            width: double.infinity,
                            controller: priceController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.service_cost_val.tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            LocaleKeys.final_price.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff3C475C),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            height: 44.h,
                            width: double.infinity,
                            controller: finalPriceController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.final_cost_val1.tr();
                              } else if (double.parse(
                                      priceController.text.toString()) <
                                  double.parse(
                                      finalPriceController.text.toString())) {
                                return LocaleKeys.final_price_val2.tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            LocaleKeys.emp_number.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff3C475C),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            height: 44.h,
                            width: double.infinity,
                            controller: emNumberController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.emp_number_val1.tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          if (widget.type == 0)
                            Text(
                              LocaleKeys.services_type.tr(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: FontPath.almaraiBold,
                                color: const Color(0xff3C475C),
                              ),
                            ),
                          if (widget.type == 0)
                            SizedBox(
                              height: 5.h,
                            ),
                          if (widget.type == 0)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      cubit.changeButtonState(onPressed: () {
                                        cubit.inHome = !cubit.inHome;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: cubit.inHome
                                            ? Colors.white
                                            : AppColorsLightTheme.primaryColor,
                                        backgroundColor: cubit.inHome
                                            ? AppColorsLightTheme.primaryColor
                                            : AppColorsLightTheme
                                                .authTextFieldFillColor,
                                        shape: const StadiumBorder()),
                                    child: Text(
                                      LocaleKeys.service_in_home.tr(),
                                      style: TextStyle(
                                          color: cubit.inHome
                                              ? Colors.white
                                              : Colors.grey,
                                          fontFamily: FontPath.almaraiRegular,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      cubit.changeButtonState(onPressed: () {
                                        cubit.inCenter = !cubit.inCenter;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: cubit.inCenter
                                            ? Colors.white
                                            : AppColorsLightTheme.primaryColor,
                                        backgroundColor: cubit.inCenter
                                            ? AppColorsLightTheme.primaryColor
                                            : AppColorsLightTheme
                                                .authTextFieldFillColor,
                                        shape: const StadiumBorder()),
                                    child: Text(
                                      LocaleKeys.services_in_center.tr(),
                                      style: TextStyle(
                                          color: cubit.inCenter
                                              ? Colors.white
                                              : Colors.grey,
                                          fontFamily: FontPath.almaraiRegular,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            LocaleKeys.main_section.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff3C475C),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          const MainSectionDropdownButton(),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomVendorButton(
                              buttonTitle: widget.servicesModel!=null?LocaleKeys.edit.tr():LocaleKeys.add.tr(),
                              isTapped: () {
                                if (formKey.currentState!.validate()) {
                                  if (widget.type == 0) {
                                    if(widget.servicesModel!=null){
                                      print("upcenter");
                                      cubit.updateServicesOfCenter(
                                        titleAr: aNameController.text,
                                        titleEn: eNameController.text,
                                        description: detailsController.text,
                                        price: double.parse(
                                            priceController.text.toString()),
                                        finalPrice: double.parse(
                                            finalPriceController.text.toString()),
                                        empNumber: double.parse(emNumberController
                                            .text
                                            .toString())
                                            .round(),
                                        duration: timeController.text, id: widget.servicesModel!.id!,
                                      );
                                    }
                                    else{
                                      cubit.addServicesOfCenter(
                                        titleAr: aNameController.text,
                                        titleEn: eNameController.text,
                                        description: detailsController.text,
                                        price: double.parse(
                                            priceController.text.toString()),
                                        finalPrice: double.parse(
                                            finalPriceController.text.toString()),
                                        empNumber: double.parse(emNumberController
                                            .text
                                            .toString())
                                            .round(),
                                        duration: timeController.text,
                                      );
                                    }
                                  } else if (widget.type == 1) {
                                    if(widget.servicesModel!=null){
                                      print("upf");
                                      cubit.updateServicesOfCenter(
                                        titleAr: aNameController.text,
                                        titleEn: eNameController.text,
                                        description: detailsController.text,
                                        price: double.parse(
                                            priceController.text.toString()),
                                        finalPrice: double.parse(
                                            finalPriceController.text.toString()),
                                        empNumber: double.parse(emNumberController
                                            .text
                                            .toString())
                                            .round(),
                                        duration: timeController.text, id: widget.servicesModel!.id!,
                                      );
                                    }
                                    else{
                                      print("addcenter");
                                      cubit.addServicesOfFreelancer(
                                        titleAr: aNameController.text,
                                        titleEn: eNameController.text,
                                        description: detailsController.text,
                                        price: double.parse(
                                            priceController.text.toString()),
                                        finalPrice: double.parse(
                                            finalPriceController.text.toString()),
                                        empNumber: double.parse(emNumberController
                                            .text
                                            .toString())
                                            .round(),
                                        duration: timeController.text,
                                      );
                                    }
                                  }
                                }
                              },
                              width: double.infinity,
                              paddingVertical: 12.h,
                              paddingHorizontal: 45.w),
                          SizedBox(
                            height: 15.h,
                          ),
                          if(widget.servicesModel!=null)CustomVendorButton(
                              buttonTitle: LocaleKeys.delete.tr(),
                              isTapped: () {
                                cubit.deleteServices(id: widget.servicesModel!.id!);
                              },
                              width: double.infinity,
                              isDeleteAlertDialog: true,
                              paddingVertical: 12.h,
                              paddingHorizontal: 45.w),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
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
