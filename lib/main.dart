import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_router/app_router.dart';
import 'core/app_router/screens_name.dart';
import 'features/authentication/presentation/screens/user_register.dart';
import 'features/authentication/presentation/screens/vendor_register.dart';

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
        return MaterialApp(
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
            primarySwatch: createMaterialColor(AppColorsLightTheme.primaryColor),
          ),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: ScreenName.splashscreen,
          // home: const VendorRegisterScreen(),
        );
      },
    );
  }
}
