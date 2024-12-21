import 'package:get/get.dart';

import '../src/features/assessment/a/assessment_binding.dart';
import '../src/features/assessment/p/assessment_screen.dart';
import '../src/features/assessment/p/result/p/result_screen.dart';
import '../src/features/authentication/auth_middleware.dart';
import '../src/features/authentication/signinpage.dart';
import '../src/features/homepage/a/home_binding.dart';
import '../src/features/homepage/p/homepage.dart';
import '../src/features/homepage/p/creation/a/creation_binding.dart';
import '../src/features/homepage/p/creation/creationpage.dart';
import '../src/features/homepage/p/feed/feedpage.dart';
import '../src/features/homepage/p/profile/profilepage.dart';
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
  static const String resultScreen = '/result';
  static const String assessmentScreen = '/assessment';

  static final List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      middlewares: [
        OnboardingMiddleware(),
        AuthMiddleware(),
      ],
      bindings: [
        HomeBinding(),
        CreationBinding(),
      ],
      children: [
        GetPage(name: feedPage, page: () => const FeedPage()),
        GetPage(
          name: creationPage,
          page: () => const CreationPage(),
        ),
        GetPage(name: profilePage, page: () => const ProfilePage()),
      ],
    ),
    GetPage(name: onboarding, page: () => const OnboardingPage()),
    GetPage(name: signUp, page: () => const SigninPage()),
    GetPage(name: signIn, page: () => const SigninPage()),
    GetPage(
      name: assessmentScreen,
      page: () => const AssessmentScreen(),
      binding: AssessmentBinding(),
    ),
    GetPage(
      name: resultScreen,
      page: () => const AssessmentResultScreen(),
    )
  ];
}
