import 'package:get/get.dart';

import '../src/features/details/presentation/detailspage.dart';
import '../src/features/homepage/presentation/homepage.dart';

class AppRoute {
  static const String home = '/';
  static const String details = '/details';

  static final List<GetPage> routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: details, page: () => const DetailsPage()),
  ];
}
