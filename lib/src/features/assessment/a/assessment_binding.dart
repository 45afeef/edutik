import 'package:get/get.dart';

import '../p/controllers/assessment_controller.dart';

class AssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssessmentController());
  }
}
