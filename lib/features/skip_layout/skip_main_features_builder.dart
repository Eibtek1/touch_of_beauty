import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/skip_layout/scip_alert_dialog.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../core/assets_path/images_path.dart';

class SkipMainFeaturedComponent extends StatefulWidget {
  const SkipMainFeaturedComponent({Key? key}) : super(key: key);

  @override
  State<SkipMainFeaturedComponent> createState() => _SkipMainFeaturedComponentState();
}

class _SkipMainFeaturedComponentState extends State<SkipMainFeaturedComponent> {
  List<String> imagesList =[
    ImagePath.hairCare,
    ImagePath.onboarding2,
    ImagePath.naturalTherapy,
    ImagePath.makeup,
    ImagePath.onboarding1,
    ImagePath.selfCare,
    ImagePath.skinCare,
    ImagePath.onboarding3,
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: imagesList.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          showDialog(context: context, builder: (context) {
            return const SkipAlertDialog(title: 'يجب تسجيل الدخول لرؤية الخدمات المتاحة',);
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 67.h,
              width: 67.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(imagesList[index]),
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: Text(
                "العناصر المميزة",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: FontPath.almaraiRegular,
                    color: const Color(0xff666666)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
