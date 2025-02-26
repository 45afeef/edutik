import 'package:get/get.dart';

import '../../src/features/assessment/a/assessment_binding.dart';
import '../../src/features/assessment/p/assessment_creation_page.dart';
import '../../src/features/assessment/p/assessment_page.dart';
import '../../src/features/assessment/p/result/p/result_page.dart';
import '../../src/features/authentication/auth_middleware.dart';
import '../../src/features/authentication/signinpage.dart';
import '../../src/features/courses/a/course_binding.dart';
import '../../src/features/courses/p/course_creation_page.dart';
import '../../src/features/homepage/a/home_binding.dart';
import '../../src/features/homepage/p/creation/a/creation_binding.dart';
import '../../src/features/homepage/p/creation/creationpage.dart';
import '../../src/features/homepage/p/feed/feedpage.dart';
import '../../src/features/homepage/p/homepage.dart';
import '../../src/features/homepage/p/profile/a/profile_binding.dart';
import '../../src/features/homepage/p/profile/p/profilepage.dart';
import '../../src/features/institute/a/institute_binding.dart';
import '../../src/features/institute/p/institutepage.dart';
import '../../src/features/onboardingPage/onboarding.dart';
import '../../src/features/onboardingPage/onboarding_middleware.dart';

class AppRoute {
  static const String home = '/';
  static const String signUp = '/signup';
  static const String signIn = '/signin';
  static const String onboarding = '/onboarding';

  static const String feedPage = '/feeds';
  static const String profilePage = '/profile';
  static const String creationPage = '/create';

  static const String publicProfilePage = '/profile/:uid';

  static const String resultPage = '/result';
  static const String assessmentPage = '/assessment/:id';

  // Creation Pages
  static const String assessmentCreationPage = '/create/assessment';
  static const String courseCreationPage = '/create/course';

  // INSTITUTE specific routes
  static const String institutePage = '/institute/:instituteId';

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
        GetPage(
          name: assessmentPage,
          page: () => const AssessmentPage(),
          binding: AssessmentBinding(),
        ),
        GetPage(
          name: assessmentCreationPage,
          page: () => AssessmentCreationPage(),
        ),
        GetPage(
          name: courseCreationPage,
          page: () => CourseCreationPage(),
        ),
        GetPage(
          name: resultPage,
          page: () => const AssessmentResultPage(),
        ),
      ],
    ),
    GetPage(name: onboarding, page: () => const OnboardingPage()),
    GetPage(name: signUp, page: () => const SigninPage()),
    GetPage(name: signIn, page: () => const SigninPage()),
    GetPage(
      name: publicProfilePage,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: institutePage,
      page: () => const Institutepage(),
      bindings: [
        InstituteBinding(),
        AssessmentBinding(),
        CourseBinding(),
      ],
    ),
  ];
}
