import 'package:get/get.dart';

import '../p/controller.dart';

class CreationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreationController>(() => CreationController());
  }
}
