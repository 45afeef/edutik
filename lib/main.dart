import 'package:edukit/utils/routes.dart';
import 'package:edukit/utils/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/locale/locale.dart';
import 'utils/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduTik',
      initialRoute: AppRoute.home,
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
