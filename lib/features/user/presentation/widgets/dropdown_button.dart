import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';

import '../../../../core/app_theme/light_theme.dart';

class CityDropDownButton extends StatefulWidget {
  final int? userEqualsZeroVendorEqualsOne;
  const CityDropDownButton({
    Key? key, this.userEqualsZeroVendorEqualsOne,
  }) : super(key: key);

  @override
  State<CityDropDownButton> createState() => _CityDropDownButtonState();
}

class _CityDropDownButtonState extends State<CityDropDownButton> {
  @override
  void initState() {
    UserServicesCubit.get(context).getCities(id: widget.userEqualsZeroVendorEqualsOne);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserServicesCubit, UserServicesState>(
      buildWhen: (p, a) {
        return p != a;
      },
      builder: (context, state) {
        var cubit = UserServicesCubit.get(context);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 45.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColorsLightTheme.authTextFieldFillColor,
          ),
          child: state is! GetCitiesLoading
              ? DropdownButton(
                  hint: const Text('المدينة'),
                  elevation: 0,
                  underline: const SizedBox.shrink(),
                  value: cubit.citiesModel,
                  items: cubit.citiesList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name!),
                          ))
                      .toList(),
                  onChanged: (value) {
                    cubit.onCityChanged(value!);
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
