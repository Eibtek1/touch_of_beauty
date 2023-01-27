import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_cubit.dart';
import 'core/app_router/app_router.dart';
import 'core/app_router/screens_name.dart';
import 'features/vendor/presentation/screens/vendor_center_screens/center_details_screen.dart';
import 'features/vendor/presentation/screens/vendor_center_screens/edit_center_details.dart';
import 'features/vendor/presentation/screens/vendor_notification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ReservationCubit()),
          ],
          child: MaterialApp(
            title: 'لمسة جمال',
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("ar", "AE") // OR Locale('ar', 'AE') OR Other RTL locales
            ],
            theme: ThemeData(
              primarySwatch:
                  createMaterialColor(AppColorsLightTheme.primaryColor),
            ),
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: ScreenName.splashscreen,
            // home: const EditCenterDetailsScreen(),
          ),
        );
      },
    );
  }
}
