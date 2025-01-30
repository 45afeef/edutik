import 'package:get/get.dart';

import '../../../do/repo/shorts_repo.dart';
import '../../../do/shorts_entity.dart';

class FeedController extends GetxController {
  static FeedController get call => Get.find();

  // Initialize ShortsRepository - which is responsible to comunicate with data sources
  final ShortsRepository shortsRepository = Get.find<ShortsRepository>();

  // Define the necessary variables and methods for the feed page
  final RxList<ShortsEntity> shortsList = <ShortsEntity>[].obs;

  void loadFeed() async {
    var fetchedShorts = await shortsRepository.readAll('user ID');
    // Logic to load feed items
    shortsList.assignAll(fetchedShorts);
  }

  @override
  void onInit() {
    super.onInit();
    loadFeed();
  }

  void refreshFeed() {
    // Logic to refresh the feed
    loadFeed();
  }
}
