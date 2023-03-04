import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/user/presentation/screens/user_profile_screen.dart';
import 'package:touch_of_beauty/features/user/presentation/screens/user_reservations_screen.dart';
import 'user_home_screen.dart';
import 'user_notification_screen.dart';

class UserMainLayout extends StatefulWidget {
  const UserMainLayout({Key? key}) : super(key: key);

  @override
  State<UserMainLayout> createState() => _UserMainLayoutState();
}

class _UserMainLayoutState extends State<UserMainLayout> {
  int cIndex = 0;
  List<Widget> screens = [
    const UserHomeScreen(),
    const UserReservationsScreen(),
    const UserNotificationScreen(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            onTap: (index) {
              print(token);
              setState(() {
                cIndex = index;
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
                  label: 'حجزاتي'),
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
      ),
    );
  }
}
