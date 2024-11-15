import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import 'network_info.dart';
import 'service_managers/repository_manager.dart';

/// A class for setting up initial dependencies using GetX dependency injection.
///
/// This class extends the [Bindings] class and overrides the [dependencies]
/// method to register dependencies using GetX's [Get.put] method.
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Initialize the RepositoryManager
    Get.put<RepositoryManager>(RepositoryManager());

    // Network connectivity
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
