import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../buisness_logic/auth_cubit.dart';
import '../../buisness_logic/auth_state.dart';

class CityDropDownButton extends StatefulWidget {
  const CityDropDownButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CityDropDownButton> createState() => _CityDropDownButtonState();
}

class _CityDropDownButtonState extends State<CityDropDownButton> {
  @override
  void initState() {
    AuthCubit.get(context).getCities();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (p,a){
        return p!=a;
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
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
                  value: cubit.cityValue,
                  items: cubit.citiesNamesList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
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
