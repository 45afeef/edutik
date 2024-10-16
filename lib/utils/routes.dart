import 'package:get/get.dart';

import '../src/features/authentication/auth_middleware.dart';
import '../src/features/authentication/signinpage.dart';
import '../src/features/homepage/bindings/home_binding.dart';
import '../src/features/homepage/presentation/creation/presentation/creationpage.dart';
import '../src/features/homepage/presentation/feed/presentation/feedpage.dart';
import '../src/features/homepage/presentation/homepage.dart';
import '../src/features/homepage/presentation/profile/presentation/profilepage.dart';
import '../src/features/onboardingScreen/onboarding.dart';
import '../src/features/onboardingScreen/onboarding_middleware.dart';

class AppRoute {
  static const String home = '/';
  static const String signUp = '/signup';
  static const String signIn = '/signin';
  static const String onboarding = '/onboarding';

  static const String feedPage = '/feeds';
  static const String profilePage = '/profile';
  static const String creationPage = '/create';

  static final List<GetPage> routes = [
    GetPage(
        name: home,
        page: () => const HomePage(),
        middlewares: [
          OnboardingMiddleware(),
          AuthMiddleware(),
        ],
        binding: HomeBinding(),
        children: [
          GetPage(name: feedPage, page: () => const FeedPage()),
          GetPage(name: creationPage, page: () => const CreationPage()),
          GetPage(name: profilePage, page: () => const ProfilePage()),
        ]),
    GetPage(name: onboarding, page: () => const OnboardingPage()),
    GetPage(name: signUp, page: () => const SigninPage()),
    GetPage(name: signIn, page: () => const SigninPage()),
  ];
}
