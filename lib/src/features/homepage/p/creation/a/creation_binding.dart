import 'package:get/get.dart';

import '../p/creation_controller.dart';

class CreationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShortsCreationController>(() => ShortsCreationController());
  }
}
