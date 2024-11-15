import 'package:get/get.dart';

import '../../src/features/homepage/da/repo/dummy_repo.dart';
import '../../src/features/homepage/da/repo/firebase_repo.dart';
import '../../src/features/homepage/da/repo/network_repo.dart';
import '../../src/features/homepage/do/repo/shorts_repo.dart';

class RepositoryManager extends GetxService {
  // Add all repositories here
  late ShortsRepository shortsRepository;

  @override
  void onInit() {
    super.onInit();
    // Default implementations
    shortsRepository = DummyShortsRepository();
  }

  // Method to switch repository implementations
  void switchToNetworkRepositories() {
    shortsRepository = NetworkShortsRepository();
  }

  void switchToFirebaseRepositories() {
    shortsRepository = FirebaseShortsRepository();
  }

  // Add more switch methods as needed
}
