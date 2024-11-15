import 'package:get/get.dart';

import '../../../../../../utils/service_managers/repository_manager.dart';
import '../../../do/repo/shorts_repo.dart';
import '../../../do/shorts_entity.dart';

class FeedController extends GetxController {
  final ShortsRepository shortsRepository =
      Get.find<RepositoryManager>().shortsRepository;

  // Define the necessary variables and methods for the feed page
  final RxList<ShortsEntity> shortsList = <ShortsEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFeed();
  }

  // ============================================================= //
  // =============            METHODS             ================ //
  // ============================================================= //
  void fetchShorts() async {
    shortsList.value = await shortsRepository.fetchAllShorts();
  }

  void loadFeed() async {
    var fetchedShorts = await shortsRepository.fetchAllShorts();
    // Logic to load feed items
    shortsList.assignAll(fetchedShorts);
  }

  void refreshFeed() {
    // Logic to refresh the feed
    loadFeed();
  }
}
