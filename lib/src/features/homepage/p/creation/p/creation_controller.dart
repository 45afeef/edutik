import 'package:get/get.dart';

import '../../../da/shorts_model.dart';
import '../../../do/repo/shorts_repo.dart';
import '../../../do/shorts_entity.dart';

class ShortsCreationController extends GetxController {
  final ShortsRepository shortsRepository = Get.find<ShortsRepository>();

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

  void clearFields() {
    title.value = '';
    description.value = '';
    videoUrl.value = '';
    videoSource.value = VideoSource.network;
  }

  Future<void> submitCreation() {
    ShortsModel shorts = ShortsModel(
      creatorProfile:
          'currentUserProfile', // TODO - update the current user profile here.
      creatorName:
          'currentUserName', // TODO - update the current user name here.
      description: description.value,
      videoUrl: videoUrl.value,
      videoSource: videoSource.value,
      title: title.value,
      likes: 0,
      views: 0,
    );

    // Save the shorts
    return shortsRepository.create(shorts);
  }

  void updateTitleDescriptionVideourlAndType(
    String title,
    String description,
    String videoUrl,
    VideoSource videoSource,
  ) {
    this.title.value = title;
    this.description.value = description;
    this.videoUrl.value = videoUrl;
    this.videoSource.value = videoSource;
  }
}
