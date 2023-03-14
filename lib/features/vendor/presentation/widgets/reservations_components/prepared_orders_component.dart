import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_state.dart';
import '../order_item_builder.dart';

class PreparedOrdersComponent extends StatefulWidget {
  const PreparedOrdersComponent({Key? key}) : super(key: key);

  @override
  State<PreparedOrdersComponent> createState() =>
      _PreparedOrdersComponentState();
}

class _PreparedOrdersComponentState extends State<PreparedOrdersComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VReservationCubit, VReservationState>(
      buildWhen: (previous, current) {
        if (previous != current) {
          return true;
        } else if (current is GetPreparedOrdersLoading ||
            current is GetPreparedOrdersSuccess ||
            current is GetPreparedOrdersError) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = VReservationCubit.get(context);
        return state is! GetPreparedOrdersLoading
            ? cubit.getPreparedOrdersList.isNotEmpty
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
                          reserveModel: cubit.getPreparedOrdersList[index],
                        ),
                      );
                    },
                    itemCount: cubit.getPreparedOrdersList.length,
                  )
                : Center(
                    child: Text(
                      'لا يوجد خدمات بعد',
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
