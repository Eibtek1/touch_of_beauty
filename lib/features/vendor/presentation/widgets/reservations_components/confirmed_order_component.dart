import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_state.dart';
import '../order_item_builder.dart';

class ConfirmedOrdersComponent extends StatefulWidget {
  const ConfirmedOrdersComponent({Key? key}) : super(key: key);

  @override
  State<ConfirmedOrdersComponent> createState() =>
      _ConfirmedOrdersComponentState();
}

class _ConfirmedOrdersComponentState extends State<ConfirmedOrdersComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VReservationCubit, VReservationState>(
      buildWhen: (previous, current) {
        if(previous != current){
          return true;
        }else if(current is GetConfirmedOrdersLoading||current is GetConfirmedOrdersSuccess||current is GetConfirmedOrdersError){
          return true;
        }else{
          return false;
        }
      } ,
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = VReservationCubit.get(context);
        return state is! GetConfirmedOrdersLoading
            ? cubit.getConfirmedOrdersList.isNotEmpty
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
                          reserveModel: cubit.getConfirmedOrdersList[index],
                        ),
                      );
                    },
                    itemCount: cubit.getConfirmedOrdersList.length,
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
