import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_state.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/custom_button.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../translations/locale_keys.g.dart';

class AddRateTypeDialog extends StatefulWidget {
  final int type;
  final int serviceId;
  final String serviceProviderId;
  const AddRateTypeDialog({Key? key, required this.type, required this.serviceId, required this.serviceProviderId}) : super(key: key);

  @override
  State<AddRateTypeDialog> createState() => _AddRateTypeDialogState();
}

class _AddRateTypeDialogState extends State<AddRateTypeDialog> {
  int rate = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 170.h,
        child: BlocConsumer<ReservationCubit, ReservationState>(
          listener: (context, state) {
            if(state is AddServiceProviderRatingLoadingState || state is AddServiceRatingLoadingState){
              showProgressIndicator(context);
            }
            if(state is AddServiceRatingSuccessState){
              Navigator.pop(context);
              Navigator.pop(context);
              Fluttertoast.showToast(msg: state.mainResponse.errorMessage);
            }
            if(state is AddServiceProviderRatingSuccessState){
              Navigator.pop(context);
              Navigator.pop(context);
              Fluttertoast.showToast(msg: state.mainResponse.errorMessage);
            }
          },
          builder: (context, state) {
            var cubit = ReservationCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.type == 0
                      ? LocaleKeys.serviceRating.tr()
                      : LocaleKeys.serviceProviderRating.tr(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: FontPath.almaraiRegular,
                    color: const Color(
                      0xff1E2432,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                RatingBar.builder(
                  itemSize: 35.r,
                  ignoreGestures: false,
                  initialRating: 0,
                  minRating: 1,
                  unratedColor: Colors.grey,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  // itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: AppColorsLightTheme.secondaryColor,
                  ),
                  onRatingUpdate: (rating) {
                    rate = rating.round();
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomUserButton(
                  buttonTitle: LocaleKeys.sendRate.tr(),
                  isTapped: () {
                    if(widget.type == 0){
                      cubit.addServiceRating(rating: rate, serviceId: widget.serviceId);
                    }else{
                      cubit.addServiceProviderRating(rating: rate, serviceProviderId: widget.serviceProviderId);
                    }
                  },
                  width: 110.w,
                  paddingVertical: 0,
                  paddingHorizontal: 0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
