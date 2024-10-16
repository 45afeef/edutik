import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'creation/presentation/creationpage.dart';
import 'feed/presentation/feedpage.dart';
import 'profile/presentation/profilepage.dart';

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
            selectedItemColor: Colors.amber,
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
