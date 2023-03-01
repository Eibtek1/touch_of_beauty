import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:touch_of_beauty/core/network/dio_helper.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_cubit.dart';
import 'bloc_observer.dart';
import 'core/app_router/app_router.dart';
import 'core/app_router/screens_name.dart';
import 'core/cache_manager/shared_preferences.dart';
import 'features/authentication/buisness_logic/auth_cubit.dart';
import 'features/user/buisness_logic/main_features_cubit/main_features_cubit.dart';
import 'features/user/buisness_logic/services_providers_cubit/services_providers_cubit.dart';
import 'features/vendor/buisness_logic/services_cubit/vendor_services_cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ReservationCubit()),
            BlocProvider(create: (context) => UserServicesCubit()),
            BlocProvider(create: (context) => VendorServicesCubit()),
            BlocProvider(create: (context) => ServicesProvidersCubit()..getSliderPhotos()),
            BlocProvider(create: (context) => MainFeaturesCubit()),
            BlocProvider(create: (context) => AuthCubit()),
          ],
          child: MaterialApp(
            title: 'لمسة جمال',
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("ar", "AE")
            ],
            theme: ThemeData(
              primarySwatch:
                  createMaterialColor(AppColorsLightTheme.primaryColor),
            ),
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: ScreenName.splashscreen,
            // home:  SearchScreen(),
          ),
        );
      },
    );
  }
}
