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
import 'package:touch_of_beauty/features/user/presentation/screens/user_main_layout.dart';
import '../../features/authentication/presentation/screens/vendor_register.dart';
import '../../features/chat/presentation/screens/chat_screen.dart';
import '../../features/freelancer/presentation/screens/freelance_main_layout.dart';
import '../../features/freelancer/presentation/screens/freelancer_center_screens/edit_freelancer_details.dart';
import '../../features/freelancer/presentation/screens/freelancer_center_screens/freelancer_add_services_screen.dart';
import '../../features/freelancer/presentation/screens/freelancer_center_screens/freelancer_details_screen.dart';
import '../../features/freelancer/presentation/screens/freelancer_center_screens/freelancer_services_screen.dart';
import '../../features/freelancer/presentation/screens/freelancer_center_screens/freelancer_working_time_screen.dart';
import '../../features/freelancer/presentation/screens/freelancer_notification_screen.dart';
import '../../features/user/data/models/services_model.dart';
import '../../features/user/presentation/screens/home_screen_screens/all_centers_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/main_featuers_services.dart';
import '../../features/user/presentation/screens/home_screen_screens/complains_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/gallery_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/offers_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/order_screens/add_address_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/order_screens/choose_address_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/order_screens/order_details_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/order_screens/payment_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/order_screens/reserve_order_screen.dart';
import '../../features/user/presentation/screens/home_screen_screens/our_services_screen.dart';
import '../../features/vendor/presentation/screens/order_screens/center_orders_details_screen.dart';
import '../../features/vendor/presentation/screens/order_screens/home_orders_details_screen.dart';
import '../../features/vendor/presentation/screens/vendor_center_screens/add_services_screen.dart';
import '../../features/vendor/presentation/screens/vendor_center_screens/center_details_screen.dart';
import '../../features/vendor/presentation/screens/vendor_center_screens/center_working_time_screen.dart';
import '../../features/vendor/presentation/screens/vendor_center_screens/edit_center_details.dart';
import '../../features/vendor/presentation/screens/vendor_center_screens/vendor_reservations_screen.dart';
import '../../features/vendor/presentation/screens/vendor_center_screens/vendor_services_screen.dart';
import '../../features/vendor/presentation/screens/vendor_main_layout.dart';
import '../../features/vendor/presentation/screens/vendor_notification_screen.dart';



class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.splashscreen:
          return MaterialPageRoute(builder: (BuildContext context) { return const SplashScreen(); });
        case ScreenName.userMainLayout:
          return MaterialPageRoute(builder: (BuildContext context) { return const UserMainLayout(); });
        case ScreenName.vendorMainLayout:
          return MaterialPageRoute(builder: (BuildContext context) { return const VendorMainLayout(); });
        case ScreenName.freelancerMainLayout:
          return MaterialPageRoute(builder: (BuildContext context) { return const FreelancerMainLayout(); });
        case ScreenName.onboardingScreen:
          return MaterialPageRoute(builder: (BuildContext context) { return const OnboardingScreen(); });
        case ScreenName.chooseRegisterType:
          return _animateRouteBuilder(const ChooseTypeScreen());
        case ScreenName.orderInCenterDetailsScreen:
          return _animateRouteBuilder(const CenterOrderDetailsScreen());
        case ScreenName.orderInHomeDetailsScreen:
          return _animateRouteBuilder(const HomeOrderDetailsScreen());
        case ScreenName.vendorNotificationScreen:
          return _animateRouteBuilder(const VendorNotificationScreen());
        case ScreenName.freelancerNotificationScreen:
          return _animateRouteBuilder(const FreelancerNotificationScreen());
        case ScreenName.orderDetailsScreen:
          return _animateRouteBuilder(const OrderDetailsScreen());
        case ScreenName.userCategoryDetailsScreen:
          final arg = settings.arguments;
          MainFeatureServicesArgs arguments = arg as MainFeatureServicesArgs;
          return _animateRouteBuilder(CategoryDetailsScreen(title: arguments.title,mainFeatureId:arguments.mainFeatureId));
        case ScreenName.userSearchScreen:
          final arg = settings.arguments;
          return _animateRouteBuilder( SearchScreen(servicesProviderId: arg,));
        case ScreenName.editCenterScreen:
          return _animateRouteBuilder( const EditCenterDetailsScreen());
        case ScreenName.freelancerDetailsScreen:
          return _animateRouteBuilder( const FreelancerDetailsScreen());
        case ScreenName.freelancerEditDetailsScreen:
          return _animateRouteBuilder( const EditFreelancerDetailsScreen());
        case ScreenName.freelancerTimeScreen:
          return _animateRouteBuilder( const FreelancerWorkingTimeScreen());
        case ScreenName.vendorServicesScreen:
          return _animateRouteBuilder( const VendorServicesScreen());
        case ScreenName.freelancerServicesScreen:
          return _animateRouteBuilder( FreelancerServicesScreen());
        case ScreenName.vendorReservationsScreen:
          return _animateRouteBuilder( const VendorReservationsScreen());
        case ScreenName.vendorAddToServicesScreen:
          return _animateRouteBuilder( const AddServicesScreen());
        case ScreenName.freelancerAddToServicesScreen:
          return _animateRouteBuilder( const FreelancerAddServicesScreen());
        case ScreenName.centerWorkingTimeScreen:
          return _animateRouteBuilder( const CenterWorkingTimeScreen());
        case ScreenName.detailsCenterScreen:
          return _animateRouteBuilder( CenterDetailsScreen());
        case ScreenName.loginScreen:
          return _animateRouteBuilder(const LoginScreen());
        case ScreenName.userRegister:
          return _animateRouteBuilder(const UserRegisterScreen());
        case ScreenName.vendorRegister:
          return _animateRouteBuilder(const VendorRegisterScreen());
        case ScreenName.otpScreen:
          final args = settings.arguments;
          OtpArgs arguments = args as OtpArgs;
          return _animateRouteBuilder( OtpScreen(phoneNumber: arguments.phoneNumber, isConfirmPassword: arguments.isConfirmPassword,));
        case ScreenName.addAddressScreen:
          return _animateRouteBuilder(const AddAddressScreen());
        case ScreenName.paymentScreen:
          return _animateRouteBuilder(const PaymentScreen());
        case ScreenName.chooseAddressScreen:
          return _animateRouteBuilder(const ChooseAddressScreen());
        case ScreenName.reserveOrderScreen:
          final ServicesModel args = settings.arguments as ServicesModel;
          return _animateRouteBuilder(ReserveOrderScreen(servicesModel: args,));
        case ScreenName.allCentersScreen:
          return _animateRouteBuilder(const AllCentersScreen());
        case ScreenName.ourServicesScreen:
          final args = settings.arguments;
          return _animateRouteBuilder(OurServicesScreen(id:args));
        case ScreenName.offersScreen:
          return _animateRouteBuilder(const OffersScreen());
        case ScreenName.complainsScreen:
          return _animateRouteBuilder(const ComplainsScreen());
        case ScreenName.galleryScreen:
          final arg = settings.arguments;
          return _animateRouteBuilder(GalleryScreen(galleryList: arg,));
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