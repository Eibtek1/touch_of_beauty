import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/custom_button.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../translations/locale_keys.g.dart';
import 'add_rate_alert_dialog.dart';

class ChooseRateTypeDialog extends StatelessWidget {
  final int serviceId;
  final String serviceProviderId;
  const ChooseRateTypeDialog({Key? key, required this.serviceId, required this.serviceProviderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(serviceId);
    print(serviceProviderId);
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 120.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.choose_rate_type.tr(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontPath.almaraiRegular,
                  color: const Color(0xff1E2432)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomUserButton(
                    buttonTitle: LocaleKeys.rate_serv.tr(),
                    isTapped: () {
                      Navigator.pop(context);
                      showDialog(context: context, builder: (context) =>AddRateTypeDialog(type: 0, serviceId: serviceId, serviceProviderId: serviceProviderId,));
                    },
                    width: 110.w,
                    paddingVertical: 0,
                    paddingHorizontal: 0),
                CustomUserButton(
                    buttonTitle: LocaleKeys.rate_ser_prov.tr(),
                    isTapped: () {
                      Navigator.pop(context);
                      showDialog(context: context, builder: (context) =>AddRateTypeDialog(type: 1, serviceId: serviceId, serviceProviderId: serviceProviderId,));
                    },
                    width: 110.w,
                    paddingVertical: 0,
                    paddingHorizontal: 0)
              ],
            )
          ],
        ),
      ),
    );
  }
}
