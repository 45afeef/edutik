import 'package:get/get.dart';

import '../p/controllers/institute_controller.dart';

class InstituteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstituteController());
  }
}
