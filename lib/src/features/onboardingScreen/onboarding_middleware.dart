import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/routes.dart';
import '../../../utils/shared_prefs.dart';
import '../authentication/auth_service.dart';

class OnboardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return SharedPrefsUtil().isOnboardingShown() &&
            AuthService().isAuthenticated
        ? null
        : const RouteSettings(name: AppRoute.onboarding);
  }
}
