import 'package:flutter/material.dart';

class FreelancerMoreScreen extends StatelessWidget {
  const FreelancerMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('freelancer moreScreen'),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../core/app_theme/light_theme.dart';
// import '../../../../core/assets_path/svg_path.dart';
// import 'freelancer_centers_screen.dart';
// import 'freelancer_home_screen.dart';
// import 'freelancer_messages_screen.dart';
// import 'freelancer_more_screen.dart';
//
// class FreelancerMainLayout extends StatefulWidget {
//   const FreelancerMainLayout({Key? key}) : super(key: key);
//
//   @override
//   State<FreelancerMainLayout> createState() => _UserMainLayoutState();
// }
//
// class _UserMainLayoutState extends State<FreelancerMainLayout> {
//   int cIndex = 0;
//   List<Widget> screens= [
//     const FreelancerHomeScreen(),
//     FreelancerMessagesScreen(),
//     const FreelancerCentersScreen(),
//     const FreelancerMoreScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: screens[cIndex],
//         bottomNavigationBar: SizedBox(
//           height: 70.h,
//           child: BottomNavigationBar(
//             backgroundColor: Colors.white,
//             selectedFontSize: 13.sp,
//             unselectedFontSize: 12.sp,
//             showSelectedLabels: true,
//             showUnselectedLabels: true,
//             selectedItemColor: AppColorsLightTheme.primaryColor,
//             unselectedItemColor: Colors.grey,
//             currentIndex: cIndex,
//             selectedLabelStyle: const TextStyle(
//               color: AppColorsLightTheme.primaryColor,
//             ),
//             unselectedLabelStyle: const TextStyle(
//               color: Colors.grey,
//             ),
//             onTap: (index) {
//               setState(() {
//                 cIndex = index;
//               });
//             },
//             items: [
//               BottomNavigationBarItem(
//                 icon: SvgPicture.asset(
//                   SvgPath.homeIcon,
//                   color: cIndex == 0
//                       ? AppColorsLightTheme.primaryColor
//                       : Colors.grey,
//                 ),
//                 label: 'الرئيسية',
//               ),
//               BottomNavigationBarItem(
//                   icon: SvgPicture.asset(SvgPath.messagesIcon,
//                       color: cIndex == 1
//                           ? AppColorsLightTheme.primaryColor
//                           : Colors.grey),
//                   label: 'محادثاتي'),
//               BottomNavigationBarItem(
//                   icon: SvgPicture.asset(SvgPath.centersIcon,
//                       color: cIndex == 2
//                           ? AppColorsLightTheme.primaryColor
//                           : Colors.grey),
//                   label: 'صالوني'),
//               BottomNavigationBarItem(
//                   icon: SvgPicture.asset(SvgPath.moreIcon,
//                       color: cIndex == 3
//                           ? AppColorsLightTheme.primaryColor
//                           : Colors.grey),
//                   label: 'المزيد'),
//             ],
//           ),
//         ),
//
//       ),
//     );
//   }
// }

