import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/svg_path.dart';
import '../../widgets/order_item_builder.dart';

class VendorReservationsScreen extends StatelessWidget {
  const VendorReservationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColorsLightTheme.primaryColor,
          foregroundColor: Colors.white,
          toolbarHeight: 60.h,
          centerTitle: true,
          title: Text(
            'حجزاتي',
            style: TextStyle(
              fontSize: 17.sp,
              fontFamily: FontPath.almaraiBold,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(tabs: [
            Tab(
              child: Text('الحالية',style: TextStyle(color: Colors.white,fontSize: 14.sp,fontFamily: FontPath.almaraiRegular),),
            ),
            Tab(
              child: Text('السابقة',style: TextStyle(color: Colors.white,fontSize: 14.sp,fontFamily: FontPath.almaraiRegular)),
            ),
          ]),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, ScreenName.vendorNotificationScreen);
              },
              icon: SvgPicture.asset(
                SvgPath.notificationBill,
                width: 23.w,
                height: 28.h,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.sp,vertical: 10.sp),
                  child: const OrderItemBuilder(homeZeroOrCenterOne: 0),
                );
              },
              itemCount: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.sp,vertical: 15.sp),
                  child: const OrderItemBuilder(homeZeroOrCenterOne: 1),
                );
              },
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}
