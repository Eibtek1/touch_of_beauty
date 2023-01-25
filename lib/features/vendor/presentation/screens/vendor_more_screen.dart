import 'package:flutter/material.dart';

class VendorMoreScreen extends StatelessWidget {
  const VendorMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('vendor moreScreen'),
      ),
    );
  }
}
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
// import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
// import '../../../../core/assets_path/font_path.dart';
// import '../widgets/custom_vendor_button.dart';
// import '../widgets/screen_layout_widget.dart';
//
// class VendorHomeScreen extends StatefulWidget {
//   const VendorHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<VendorHomeScreen> createState() => _VendorHomeScreenState();
// }
//
// List<String> itemsList = [
//   'في المركز',
//   'في المنزل',
// ];
//
// class _VendorHomeScreenState extends State<VendorHomeScreen> {
//   String value = itemsList.first;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BackgroundScreenWidget(
//         firstContainerBackgroundHeight: 214.h,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20.h,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'الرئيسية',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: FontPath.almaraiBold,
//                           fontSize: 17.sp),
//                     ),
//                   ),
//                   SvgPicture.asset(
//                     SvgPath.notificationBill,
//                     color: Colors.white,
//                     height: 28.h,
//                     width: 23.w,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 29.h,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     height: 40.h,
//                     width: 160.w,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(26.r),
//                       color: AppColorsLightTheme.authTextFieldFillColor,
//                     ),
//                     child: Center(
//                       child: Text(
//                         'اليوم',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.grey,
//                             fontFamily: FontPath.almaraiRegular,
//                             fontSize: 14.sp),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 40.h,
//                     width: 160.w,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 27.w,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(26.r),
//                       color: AppColorsLightTheme.authTextFieldFillColor,
//                     ),
//                     child: DropdownButton(
//                       isExpanded: true,
//                       underline: const SizedBox.shrink(),
//                       items: itemsList
//                           .map((e) => DropdownMenuItem(
//                         value: e,
//                         child: Text(
//                           e,
//                           style: TextStyle(
//                               color: const Color(0xff666666),
//                               fontFamily: FontPath.almaraiRegular,
//                               fontSize: 14.sp),
//                         ),
//                       ))
//                           .toList(),
//                       onChanged: (val) {
//                         setState(() {
//                           value = val!;
//                         });
//                       },
//                       value: value,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 29.h,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: orderItemBuilder(),
//                     );
//                   },
//                   itemCount: 10,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget orderItemBuilder(){
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 10.w),
//       height: 340.h,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10.r),
//           boxShadow: [
//             BoxShadow(offset: const Offset(0, 0),blurRadius: 10.r,color: Colors.black.withOpacity(0.14))
//           ]
//       ),
//       child: Column(
//         children: [
//           Text(
//             '1 يناير 2020 مساء',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: AppColorsLightTheme.secondaryColor,
//                 fontFamily: FontPath.almaraiRegular,
//                 fontSize: 14.sp),
//           ),
//           SizedBox(height: 17.h,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               customContainer(title: 'اسم العميل', bodyTitle: 'يسرا محسن'),
//               customContainer(title: 'رقم الطلب', bodyTitle: '13455'),
//             ],
//           ),
//           SizedBox(height: 13.h,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               customContainer(title: 'اجمالي سعر الخدمات', bodyTitle: '100 ريال سعودي'),
//               customContainer(title: 'عدد الخدمات', bodyTitle: '10 خدمات'),
//             ],
//           ),
//           SizedBox(height: 17.h,),
//           CustomVendorButton(buttonTitle: 'عرض تفاصيل الطلب', isTapped: (){}, width: double.infinity, paddingVertical: 12.h, paddingHorizontal: 45.w)
//         ],
//       ),
//     );
//   }
//
//   Widget customContainer({required String title,required String bodyTitle,}){
//     return Container(
//       height: 88.h,
//       width: 150.w,
//       decoration: BoxDecoration(
//         color: AppColorsLightTheme.authTextFieldFillColor,
//         borderRadius: BorderRadius.circular(10.r),
//         border: Border.all(color: AppColorsLightTheme.primaryColor),
//
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: const Color(0xff3C475C),
//                 fontFamily: FontPath.almaraiRegular,
//                 fontSize: 14.sp),
//           ),
//           SizedBox(height: 12.h,),
//           Text(
//             bodyTitle,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: const Color(0xff3C475C),
//                 fontFamily: FontPath.almaraiRegular,
//                 fontSize: 12.sp),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
