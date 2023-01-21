import 'package:flutter/material.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/features/authentication/presentation/screens/choose_type_screen.dart';
import 'package:touch_of_beauty/features/authentication/presentation/screens/forget_password_screen.dart';
import 'package:touch_of_beauty/features/authentication/presentation/screens/login_screen.dart';
import 'package:touch_of_beauty/features/authentication/presentation/screens/otp_screen.dart';
import 'package:touch_of_beauty/features/authentication/presentation/screens/user_register.dart';
import 'package:touch_of_beauty/features/intro_screens/screens/onboarding_screen.dart';
import 'package:touch_of_beauty/features/intro_screens/screens/splash_screen.dart';
import 'package:touch_of_beauty/features/user/presentation/screens/home_screen_screens/search_screen.dart';
import 'package:touch_of_beauty/features/user/presentation/screens/main_layout.dart';

import '../../features/authentication/presentation/screens/vendor_register.dart';
import '../../features/chat/screens/chat_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/all_centers_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/categories_details_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/complains_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/gallery_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/offers_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/order_screens/chooss_address_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/order_screens/reserve_order_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/our_services_screen.dart';



class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.splashscreen:
          return MaterialPageRoute(builder: (BuildContext context) { return const SplashScreen(); });
        case ScreenName.userMainLayout:
          return MaterialPageRoute(builder: (BuildContext context) { return const UserMainLayout(); });
        case ScreenName.onboardingScreen:
          return MaterialPageRoute(builder: (BuildContext context) { return const OnboardingScreen(); });
        case ScreenName.chooseRegisterType:
          return _animateRouteBuilder(const ChooseTypeScreen());
        case ScreenName.userCategoryDetailsScreen:
          final arg = settings.arguments;
          return _animateRouteBuilder(CategoryDetailsScreen(title: arg,));
        case ScreenName.userSearchScreen:
          return _animateRouteBuilder( SearchScreen());
        case ScreenName.loginScreen:
          return _animateRouteBuilder(const LoginScreen());
        case ScreenName.userRegister:
          return _animateRouteBuilder(const UserRegisterScreen());
        case ScreenName.vendorRegister:
          return _animateRouteBuilder(const VendorRegisterScreen());
        case ScreenName.otpScreen:
          return _animateRouteBuilder(const OtpScreen());
        case ScreenName.chooseAddressScreen:
          return _animateRouteBuilder(const ChooseAddressScreen());
        case ScreenName.reserveOrderScreen:
          return _animateRouteBuilder(ReserveOrderScreen());
        case ScreenName.allCentersScreen:
          return _animateRouteBuilder(const AllCentersScreen());
        case ScreenName.ourServicesScreen:
          return _animateRouteBuilder(const OurServicesScreen());
        case ScreenName.offersScreen:
          return _animateRouteBuilder(const OffersScreen());
        case ScreenName.complainsScreen:
          return _animateRouteBuilder(const ComplainsScreen());
        case ScreenName.galleryScreen:
          return _animateRouteBuilder(GalleryScreen());
        case ScreenName.chatScreen:
          final args = settings.arguments;
          return _animateRouteBuilder(ChatScreen(title: args,));
        case ScreenName.forgetPasswordScreen:
          return _animateRouteBuilder(const ForgetPasswordScreen());
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static PageRouteBuilder _animateRouteBuilder(Widget to, {double x = 1, double y = 0}) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => to,
      transitionDuration: const Duration(milliseconds: 190),
      reverseTransitionDuration: const Duration(milliseconds: 190),
      transitionsBuilder: (context, animation, animationTime, child) {
        final tween = Tween<Offset>(begin: Offset(x, y), end: Offset.zero);
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('خطأ'),
        ),
        body: const Center(
          child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
        ),
      );
    });
  }

}