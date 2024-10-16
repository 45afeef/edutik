import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/routes.dart';
import '../../../utils/shared_prefs.dart';

class OnboardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return SharedPrefsUtil().isOnboardingShown()
        ? null
        : const RouteSettings(name: AppRoute.onboarding);
  }
}
