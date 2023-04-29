import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_state.dart';
import '../order_item_builder.dart';

class WithDriverOrdersComponent extends StatefulWidget {
  const WithDriverOrdersComponent({Key? key}) : super(key: key);

  @override
  State<WithDriverOrdersComponent> createState() =>
      _WithDriverOrdersComponentState();
}

class _WithDriverOrdersComponentState extends State<WithDriverOrdersComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VReservationCubit, VReservationState>(
      buildWhen: (previous, current) {
        if (previous != current) {
          return true;
        } else if (current is GetWithDriverOrdersLoading ||
            current is GetWithDriverOrdersSuccess ||
            current is GetWithDriverOrdersError) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = VReservationCubit.get(context);
        return state is! GetWithDriverOrdersLoading
            ? cubit.getWithDriverOrdersList.isNotEmpty
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
                          reserveModel: cubit.getWithDriverOrdersList[index],
                        ),
                      );
                    },
                    itemCount: cubit.getWithDriverOrdersList.length,
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
