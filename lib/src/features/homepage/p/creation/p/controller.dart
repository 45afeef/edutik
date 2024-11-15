import 'package:get/get.dart';

import '../../../do/shorts_entity.dart';

class CreationController extends GetxController {
  // Define the necessary variables and methods for the creation page

  final _isCreating = false.obs;
  final RxString title = ''.obs;
  final RxString description = ''.obs;
  final RxString videoUrl = ''.obs;
  final Rx<VideoSource> videoSource = VideoSource.network.obs;

  bool get isCreating => _isCreating.value;

  set isCreating(bool isCreating) {
    _isCreating.value = isCreating;
  }

  void submitCreation() {
    // Logic to submit the creation
    print('Title: $title');
    print('Description: $description');
    print('Video URL: $videoUrl');
    print('Video Source: $videoSource');
  }

  void clearFields() {
    title.value = '';
    description.value = '';
    videoUrl.value = '';
    videoSource.value = VideoSource.network;
  }
}
