import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'p/home_controller.dart';
import 'p/creation/creationpage.dart';
import 'p/feed/feedpage.dart';
import 'p/profile/profilepage.dart';

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
