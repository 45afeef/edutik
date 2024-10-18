import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'utils/locale/locale.dart';
import 'utils/routes.dart';
import 'utils/shared_prefs.dart';
import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefsUtil().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduTik',
      initialRoute: AppRoute.home,
      getPages: AppRoute.routes,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      locale: const Locale('en', 'US'),
      translations: AppTranslations(),
      fallbackLocale: const Locale('en', 'US'),
      defaultTransition: Transition.fade,
      navigatorKey: Get.key,
      supportedLocales: const [Locale('en', 'US'), Locale('hi', 'IN')],
    );
  }
}
