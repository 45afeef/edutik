import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../src/features/assessment/da/repositories/assessment_repository_impl.dart';
import '../src/features/assessment/do/repositories/assessment_repository.dart';
import '../src/features/homepage/da/repo/shorts_repository_impl.dart';
import '../src/features/homepage/do/repo/shorts_repo.dart';
import 'database/database_service.dart';
import 'database/dummy_service.dart';
import 'network_info.dart';

/// A class for setting up initial dependencies using GetX dependency injection.
///
/// This class extends the [Bindings] class and overrides the [dependencies]
/// method to register dependencies using GetX's [Get.put] method.
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Initialize the database service here (e.g., FirebaseService, SupabaseService)
    // For instance, using FirebaseService:

    Get.put<DatabaseService>(
        // UnComment only one Class. Because the DatabaseService only accepts One argument.
        DummyService() // Comment or Uncomment if you want to toggle the use DummyDataBase Service
        // FirebaseService() // Comment or Uncomment if you want to toggle the use FirebaseFirestore
        // SupabaseService() // Comment or Uncomment if you want to toggle the use  SupabaseService
        );

    // Initialize the repositories
    Get.put<ShortsRepository>(
      ShortsRepositoryImpl(Get.find<DatabaseService>()),
    );
    Get.put<AssessmentRepository>(
      AssessmentRepositoryImpl(Get.find<DatabaseService>()),
    );

    // Network connectivity
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
