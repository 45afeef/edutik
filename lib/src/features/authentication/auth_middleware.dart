import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/routes.dart';
import 'auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService().isAuthenticated
        ? null
        : const RouteSettings(name: AppRoute.signIn);
  }
}
