import 'package:edukit/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/locale/locale.dart';
import 'utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduTik',
      initialRoute: AppRoute.onboarding,
      getPages: AppRoute.routes,
      theme: lightTheme,
      darkTheme: darkTheme,
      locale: const Locale('en', 'US'),
      translations: AppTranslations(),
      fallbackLocale: const Locale('en', 'US'),
      defaultTransition: Transition.fade,
      navigatorKey: Get.key,
      supportedLocales: const [Locale('en', 'US'), Locale('hi', 'IN')],
    );
  }
}
