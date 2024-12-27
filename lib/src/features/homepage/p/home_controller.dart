import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'creation/p/creation_controller.dart';
import 'feed/p/feed_controller.dart';
import 'profile/p/profile_controller.dart';

int _initialPage = 1;

class HomeController extends GetxController {
  final RxInt currentPageIndex = _initialPage.obs;

  PageController tabsController = PageController(initialPage: _initialPage);

  // Controllers for each page
  late FeedController feedController;
  late ShortsCreationController creationController;
  late ProfileController profileController;

  void changePage(int index) {
    currentPageIndex.value = index;
    tabsController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    feedController = Get.put(FeedController());
    creationController = Get.put(ShortsCreationController());
    profileController = Get.put(ProfileController());
  }
}
