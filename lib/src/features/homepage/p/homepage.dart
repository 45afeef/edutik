import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'creation/creationpage.dart';
import 'home_controller.dart';
import 'profile/profilepage.dart';
import 'w/upcomming_feature.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Shorts'), // Create a post form like grapevine's feed.
              BottomNavigationBarItem(
                  icon: Icon(Icons.create_outlined), label: 'Create'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2), label: 'Profile'),
            ],
            currentIndex: controller.currentPageIndex.value,
            onTap: (value) {
              controller.currentPageIndex.value = value;
              controller.tabsController.jumpToPage(value);
            },
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: Get.theme.colorScheme.primary,
            unselectedItemColor: Get.theme.colorScheme.secondary,
          )),
      body: PageView(
        onPageChanged: (value) => controller.currentPageIndex.value = value,
        controller: controller.tabsController,
        children: const [
          // TODO replace this with actual feed page
          UpcomingFeature(
            featureName: 'Feeds Page',
            excerpt:
                'Update this app first whenever a new update is available to get this feature before your friends try this',
          ),
          CreationPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
