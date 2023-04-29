import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/assets_path/font_path.dart';
import 'package:touch_of_beauty/features/vendor/buisness_logic/services_cubit/vendor_services_cubit.dart';
import 'package:touch_of_beauty/features/vendor/buisness_logic/services_cubit/vendor_services_state.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../translations/locale_keys.g.dart';

class MainSectionDropdownButton extends StatefulWidget {
  const MainSectionDropdownButton({
    Key? key,
  }) : super(key: key);

  @override
  State<MainSectionDropdownButton> createState() => _MainSectionDropdownButtonState();
}

class _MainSectionDropdownButtonState extends State<MainSectionDropdownButton> {
  @override
  void initState() {
    if(VendorServicesCubit.get(context).mainSectionsFeaturedList.isEmpty){
      VendorServicesCubit.get(context).getMainSections();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorServicesCubit, VendorServicesState>(
      buildWhen: (p,a){
        return p!=a;
      },
      builder: (context, state) {
        var cubit = VendorServicesCubit.get(context);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 45.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColorsLightTheme.authTextFieldFillColor,
          ),
          child: state is! GetMainSectionsLoadingState
              ? DropdownButton(
                  hint: Text(LocaleKeys.section.tr()),
                  elevation: 0,
                  underline: const SizedBox.shrink(),
                  value: cubit.mainSectionValue,
                  dropdownColor: AppColorsLightTheme.primaryColor,
                  items: cubit.mainSectionsFeaturedList
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.title,
                          child: Text(e.title!,style: const TextStyle(color: Colors.black,fontFamily: FontPath.poppinsRegular),),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    cubit.onMainSectionChanged(value!);
                  },
                  isExpanded: true,
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
        );
      },
    );
  }
}
