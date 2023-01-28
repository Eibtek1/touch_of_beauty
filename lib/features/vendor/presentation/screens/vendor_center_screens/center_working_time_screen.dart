import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/vendor/presentation/widgets/screen_layout_widget_with_logo.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../freelancer/presentation/widgets/custom_vendor_button.dart';
import '../../widgets/center_details/time_container_widget.dart';

class CenterWorkingTimeScreen extends StatelessWidget {
  const CenterWorkingTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorsLightTheme.primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text(
          'تعديل بيانات المركز',
          style: TextStyle(
            fontSize: 17.sp,
            fontFamily: FontPath.almaraiBold,
            color: Colors.white,
          ),
        ),
      ),
      body: BackgroundScreenWithLogoWidget(
        firstContainerBackgroundHeight: 83.h,
        child: Column(
          children: [
            SizedBox(
              height: 140.h,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.w),
                children: [
                  const TimeContainerWidget(title: 'السبت'),
                  SizedBox(height: 20.h,),
                  const TimeContainerWidget(title: 'الاحد'),
                  SizedBox(height: 20.h,),
                  const TimeContainerWidget(title: 'الاثنين'),
                  SizedBox(height: 20.h,),
                  const TimeContainerWidget(title: 'الثلثاء'),
                  SizedBox(height: 20.h,),
                  const TimeContainerWidget(title: 'الاربعاء'),
                  SizedBox(height: 20.h,),
                  const TimeContainerWidget(title: 'الخميس'),
                  SizedBox(height: 20.h,),
                  const TimeContainerWidget(title: 'الجمعه'),
                  SizedBox(height: 30.h,),
                  CustomVendorButton(buttonTitle: 'تعديل', isTapped: (){}, width: double.infinity, paddingVertical: 12.h, paddingHorizontal: 45.w)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
// TimeContainerWidget(title:'الاحد')
}
