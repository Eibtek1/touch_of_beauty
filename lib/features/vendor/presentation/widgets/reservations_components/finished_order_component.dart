import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_state.dart';
import '../order_item_builder.dart';

class FinishedOrdersComponent extends StatefulWidget {
  const FinishedOrdersComponent({Key? key}) : super(key: key);

  @override
  State<FinishedOrdersComponent> createState() =>
      _FinishedOrdersComponentState();
}

class _FinishedOrdersComponentState extends State<FinishedOrdersComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VReservationCubit, VReservationState>(
      buildWhen: (previous, current) {
        if (previous != current) {
          return true;
        } else if (current is GetFinishedOrdersLoading ||
            current is GetFinishedOrdersSuccess ||
            current is GetFinishedOrdersError) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = VReservationCubit.get(context);
        return state is! GetFinishedOrdersLoading
            ? cubit.getFinishedOrdersList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0.sp,
                          vertical: 10.sp,
                        ),
                        child: OrderItemBuilder(
                          homeZeroOrCenterOne: 0,
                          reserveModel: cubit.getFinishedOrdersList[index],
                        ),
                      );
                    },
                    itemCount: cubit.getFinishedOrdersList.length,
                  )
                : Center(
                    child: Text(
                      LocaleKeys.no_services_yet.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColorsLightTheme.primaryColor,
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 17.sp),
                    ),
                  )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
