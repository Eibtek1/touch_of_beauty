import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:touch_of_beauty/core/network/dio_helper.dart';
import 'package:touch_of_beauty/features/chat/buisness_logic/chat_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'bloc_observer.dart';
import 'core/app_router/app_router.dart';
import 'core/app_router/screens_name.dart';
import 'core/cache_manager/shared_preferences.dart';
import 'features/authentication/buisness_logic/auth_cubit.dart';
import 'features/freelancer/buisness_logic/services_cubit/freelancer_services_cubit.dart';
import 'features/user/buisness_logic/main_cubit/main_cubit.dart';
import 'features/user/buisness_logic/main_features_cubit/main_features_cubit.dart';
import 'features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'features/vendor/buisness_logic/employees_cubit/employees_cubit.dart';
import 'features/vendor/buisness_logic/services_cubit/vendor_services_cubit.dart';
import 'features/vendor/buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';
import 'features/vendor/buisness_logic/work_hours_cubit/work_hours_cubit.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context , constraints ) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: constraints.maxWidth>600?true:false,
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
                BlocProvider(create: (context) => ServicesProvidersCubit()..getSliderPhotos()..getContactUs()),
                BlocProvider(create: (context) => MainFeaturesCubit()),
                BlocProvider(create: (context) => AuthCubit(),),
                BlocProvider(create: (context) => ChatCubit(),),
                BlocProvider(create: (context) => EmployeesCubit()..init(),),
              ],
              child: MaterialApp(
                title: 'لمسة جمال',
                localizationsDelegates: const [
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
                ],
                theme: ThemeData(
                  primarySwatch:
                      createMaterialColor(AppColorsLightTheme.primaryColor),

                ),
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: ScreenName.splashscreen,
                // home:  const PrivacyAndPolicy(),
              ),
            );
          },
        );
      },

    );
  }
}
