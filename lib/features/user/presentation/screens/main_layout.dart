import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/features/user/presentation/screens/profile_screen.dart';
import 'package:touch_of_beauty/features/user/presentation/screens/reservations_screen.dart';

import 'home_screen.dart';
import 'notification_screen.dart';

class UserMainLayout extends StatefulWidget {
  const UserMainLayout({Key? key}) : super(key: key);

  @override
  State<UserMainLayout> createState() => _UserMainLayoutState();
}

class _UserMainLayoutState extends State<UserMainLayout> {
  int cIndex = 0;
  List<Widget> screens= [
    const HomeScreen(),
    const ReservationsScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[cIndex],
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedFontSize: 13.sp,
          unselectedFontSize: 12.sp,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColorsLightTheme.primaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: cIndex,
          selectedLabelStyle: const TextStyle(
            color: AppColorsLightTheme.primaryColor,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
          ),
          onTap: (index) {
            setState(() {
              cIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                SvgPath.homeIcon,
                color: cIndex == 0
                    ? AppColorsLightTheme.primaryColor
                    : Colors.grey,
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(SvgPath.reservationIcon,
                    color: cIndex == 1
                        ? AppColorsLightTheme.primaryColor
                        : Colors.grey),
                label: 'حجزاتي'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(SvgPath.notificationIcon,
                    color: cIndex == 2
                        ? AppColorsLightTheme.primaryColor
                        : Colors.grey),
                label: 'اشعارات'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(SvgPath.profileIcon,
                    color: cIndex == 3
                        ? AppColorsLightTheme.primaryColor
                        : Colors.grey),
                label: 'الملف الشخصي'),
          ],
        ),
      ),
    );
  }
}
