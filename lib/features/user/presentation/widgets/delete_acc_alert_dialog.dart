import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_router/screens_name.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../freelancer/presentation/widgets/custom_vendor_button.dart';
class DeleteAccAlert extends StatelessWidget {
  const DeleteAccAlert({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 150.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('تم ارسال طلبك لحذف الحساب وسيتم الرد خلال بعض الوقت',style: TextStyle(color: Colors.black,fontSize: 16.sp,fontFamily: FontPath.poppinsRegular),),
            ),
            SizedBox(height: 30.h,),
            CustomVendorButton(
                buttonTitle: 'تم',
                isTapped: () {
                  Navigator.pop(context);
                },
                width: double.infinity,
                paddingVertical: 12.h,
                paddingHorizontal: 45.w)
          ],
        ),
      ),
    );
  }
}
