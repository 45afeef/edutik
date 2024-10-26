import 'package:get/get.dart';

class CreationController extends GetxController {
  final _isCreating = false.obs;

  bool get isCreating => _isCreating.value;

  set isCreating(bool isCreating) {
    _isCreating.value = isCreating;
  }
}
