import 'package:get/get.dart';

import '../presentation/controller.dart';

class CreationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreationController>(() => CreationController());
  }
}
