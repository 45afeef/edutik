import 'package:edukit/src/features/onboardingScreen/onboarding.dart';
import 'package:get/get.dart';

import '../src/features/details/presentation/detailspage.dart';
import '../src/features/homepage/presentation/homepage.dart';

class AppRoute {
  static const String home = '/';
  static const String signUp = '/signup';
  static const String details = '/details';
  static const String onboarding = '/onboard';

  static final List<GetPage> routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(
        name: onboarding,
        page: () =>
            const OnboardingPage(completionPage: home, fallbackPage: home)),
    GetPage(name: details, page: () => const DetailsPage()),
  ];
}
