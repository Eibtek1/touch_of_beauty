import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/features/skip_layout/skip_chat.dart';
import 'package:touch_of_beauty/features/skip_layout/skip_profile.dart';
import 'package:touch_of_beauty/features/skip_layout/skip_reservation.dart';

import '../../core/app_theme/light_theme.dart';
import '../../core/assets_path/svg_path.dart';
import 'home_screen.dart';

class MainSkipLayout extends StatefulWidget {
  const MainSkipLayout({Key? key}) : super(key: key);

  @override
  State<MainSkipLayout> createState() => _MainSkipLayoutState();
}

class _MainSkipLayoutState extends State<MainSkipLayout> {
  int cIndex = 0;
  List<Widget> screens =[
    const SkipHomeScreen(),
    const SkipReservation(),
    const SkipNotification(),
    const SkipProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[cIndex],
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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
          onTap: (value){
            setState(() {
              cIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                SvgPath.homeIcon,
                colorFilter: ColorFilter.mode(
                  cIndex == 0
                      ? AppColorsLightTheme.primaryColor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  SvgPath.reservationIcon,
                  colorFilter: ColorFilter.mode(
                    cIndex == 1
                        ? AppColorsLightTheme.primaryColor
                        : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'حجوزاتي'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  SvgPath.notificationIcon,
                  colorFilter: ColorFilter.mode(
                    cIndex == 2
                        ? AppColorsLightTheme.primaryColor
                        : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'اشعارات'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  SvgPath.profileIcon,
                  colorFilter: ColorFilter.mode(
                    cIndex == 3
                        ? AppColorsLightTheme.primaryColor
                        : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'الملف الشخصي'),
          ],
        ),
      ),
    );
  }
}
