import 'package:get/get.dart';

import '../../../../../../utils/service_managers/repository_manager.dart';
import '../../../do/repo/shorts_repo.dart';
import '../../../do/shorts_entity.dart';

class FeedController extends GetxController {
  final ShortsRepository shortsRepository =
      Get.find<RepositoryManager>().shortsRepository;

  // Define the necessary variables and methods for the feed page
  final RxList<ShortsEntity> shorts_list = <ShortsEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFeed();
  }

  // ============================================================= //
  // =============            METHODS             ================ //
  // ============================================================= //
  void fetchShorts() async {
    shorts_list.value = await shortsRepository.fetchAllShorts();
  }

  void loadFeed() async {
    var fetchedShorts = await shortsRepository.fetchAllShorts();
    // Logic to load feed items
    shorts_list.assignAll(fetchedShorts);
  }

  void refreshFeed() {
    // Logic to refresh the feed
    loadFeed();
  }
}
