import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'utils/initial_bindings.dart';
import 'utils/locale/locale.dart';
import 'utils/routing/approute.dart';
import 'utils/shared_prefs.dart';
import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefsUtil().init();

// Pass all uncaught "fatal" errors from the framework to Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduTik',
      initialBinding: InitialBindings(),
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
