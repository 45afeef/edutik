import 'package:get/get.dart';

import '/src/features/courses/controllers/batch_request_controller.dart';
import '../p/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => BatchRequestController());
  }
}
