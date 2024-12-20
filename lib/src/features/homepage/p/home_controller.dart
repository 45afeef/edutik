import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'creation/p/creation_controller.dart';
import 'feed/p/feed_controller.dart';
import 'profile/p/profile_controller.dart';

int _initialPage = 2;

class HomeController extends GetxController {
  final RxInt currentPageIndex = _initialPage.obs;

  PageController tabsController = PageController(initialPage: _initialPage);

  // Controllers for each page
  late FeedController feedController;
  late CreationController creationController;
  late ProfileController profileController;

  void changePage(int index) {
    currentPageIndex.value = index;
    tabsController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    feedController = Get.put(FeedController());
    creationController = Get.put(CreationController());
    profileController = Get.put(ProfileController());
  }
}
