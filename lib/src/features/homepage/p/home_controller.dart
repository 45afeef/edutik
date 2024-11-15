import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'creation/p/controller.dart';
import 'feed/p/controller.dart';
import 'profile/p/controller.dart';

int _initialPage = 0;

class HomeController extends GetxController {
  final RxInt currentPageIndex = _initialPage.obs;

  PageController tabsController = PageController(initialPage: _initialPage);

  // Controllers for each page
  late FeedController feedController;
  late CreationController creationController;
  late ProfileController profileController;

  @override
  void onInit() {
    super.onInit();
    feedController = Get.put(FeedController());
    creationController = Get.put(CreationController());
    profileController = Get.put(ProfileController());
  }

  void changePage(int index) {
    currentPageIndex.value = index;
    tabsController.jumpToPage(index);
  }
}
