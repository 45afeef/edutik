import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/routing/approute.dart';
import '../../../utils/shared_prefs.dart';
import '../authentication/auth_service.dart';

class OnboardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Redirect to onboarding page if the user either not authenticated 
    // or never seen the onboarding page before
    return SharedPrefsUtil().isOnboardingShown() &&
            AuthService().isAuthenticated
        ? null
        : const RouteSettings(name: AppRoute.onboarding);
  }
}
