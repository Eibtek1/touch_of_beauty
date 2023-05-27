import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/core/network/dio_helper.dart';
import 'package:touch_of_beauty/features/authentication/data/repository/auth_repository.dart';
import 'package:touch_of_beauty/features/chat/buisness_logic/chat_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'package:touch_of_beauty/translations/codegen_loader.g.dart';
import 'bloc_observer.dart';
import 'core/app_router/app_router.dart';
import 'core/app_router/screens_name.dart';
import 'core/cache_manager/shared_preferences.dart';
import 'core/notification/notification_services.dart';
import 'features/authentication/buisness_logic/auth_cubit.dart';
import 'features/freelancer/buisness_logic/services_cubit/freelancer_services_cubit.dart';
import 'features/user/buisness_logic/main_cubit/main_cubit.dart';
import 'features/user/buisness_logic/main_features_cubit/main_features_cubit.dart';
import 'features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'features/user/presentation/widgets/calender_widget.dart';
import 'features/vendor/buisness_logic/employees_cubit/employees_cubit.dart';
import 'features/vendor/buisness_logic/services_cubit/vendor_services_cubit.dart';
import 'features/vendor/buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';
import 'features/vendor/buisness_logic/work_hours_cubit/work_hours_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.initializeNotificationService(
    _onDidReceiveNotificationResponse,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  if (token != null) {
    AuthRepository.sendNotification();
  }
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en',),
        Locale('ar',),
      ],
      startLocale: Locale.fromSubtags(languageCode: initialLocale),
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: constraints.maxWidth > 600 ? true : false,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MultiBlocProvider(
              providers: [
                // BlocProvider(create: (context) => MainCubit(authCubit: AuthCubit.get(context))),
                BlocProvider(create: (context) => MainCubit()..initFunction()),
                BlocProvider(create: (context) => ReservationCubit()..getOrdersForUser()),
                BlocProvider(create: (context) => FreelancerServicesCubit()),
                BlocProvider(create: (context) => VReservationCubit()),
                BlocProvider(create: (context) => WorkHoursCubit()..getWorkHours()),
                BlocProvider(create: (context) => UserServicesCubit()..getAddress()),
                BlocProvider(create: (context) => VendorServicesCubit()),
                BlocProvider(create: (context) => ServicesProvidersCubit()),
                BlocProvider(create: (context) => MainFeaturesCubit()),
                BlocProvider(create: (context) => AuthCubit(),),
                BlocProvider(create: (context) => ChatCubit(),),
                BlocProvider(create: (context) => EmployeesCubit()..init(),),
              ],
              child: MaterialApp(
                title: 'Beauty touch',
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: ThemeData(
                  primarySwatch:
                      createMaterialColor(AppColorsLightTheme.primaryColor),
                ),
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: ScreenName.splashscreen,
                // home:  SelectDate(providerId: '7fbb907a-0e48-45e6-9129-bbfcbda537f5',),
              ),
            );
          },
        );
      },
    );
  }
}

final StreamController<NotificationResponse?> selectNotificationStream =
    StreamController<NotificationResponse?>.broadcast();

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.displayPushNotification(message);
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // handle action
}

void _onDidReceiveNotificationResponse(
  NotificationResponse details,
) {
  selectNotificationStream.add(details);
}
