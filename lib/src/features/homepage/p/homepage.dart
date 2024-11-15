import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'creation/p/creationpage.dart';
import 'feed/p/feedpage.dart';
import 'profile/p/profilepage.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2), label: 'Profile'),
            ],
            currentIndex: controller.currentPageIndex.value,
            onTap: (value) {
              controller.currentPageIndex.value = value;
              controller.tabsController.jumpToPage(value);
            },
            selectedItemColor: Colors.pink,
          )),
      body: PageView(
        onPageChanged: (value) => controller.currentPageIndex.value = value,
        controller: controller.tabsController,
        children: const [
          FeedPage(),
          CreationPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
