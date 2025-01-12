import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/theme/theme_controller.dart';
import 'p/profile_controller.dart';
import 'w/profile_info.dart';
import 'w/profile_uploads.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? profileId = Get.parameters['uid'];
    controller.fetchProfile(profileId);

    final ThemeController themController = Get.put(ThemeController());

    return SafeArea(
      child: Scaffold(
        // Persistent AppBar that never scrolls
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: themController.toggleTheme,
              icon: Icon(
                themController.isDarkMode.value
                    ? Icons.nights_stay_sharp
                    : Icons.sunny,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                            controller.signOut();
                          },
                          child: Text("lbl_logout".tr),
                        ),
                        const SizedBox(width: 30),
                        ElevatedButton(
                            onPressed: Get.back, child: Text("lbl_cancel".tr)),
                      ],
                      content: Text('msg_are_you_sure_to_logout'.tr),
                    );
                  },
                );
              },
              icon: const Icon(Icons.logout),
            ),
            const IconButton(onPressed: null, icon: Icon(Icons.settings)),
          ],
          elevation: 0.0,
        ),
        body: NestedScrollView(
          // allows you to build a list of elements that would be scrolled away till the body reached the top
          headerSliverBuilder: (context, _) {
            return [
              Obx(
                () => ProfileInfo(user: controller.userProfile.value),
              )
            ];
          },
          // You tab view goes here
          body: const ProfileUploads(),
        ),
      ),
    );
  }
}
