import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/theme/theme_controller.dart';
import '../../../authentication/auth_service.dart';
import 'p/profile_controller.dart';
import 'w/profile_uploads.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    final ThemeController themController = Get.put(ThemeController());

    return Scaffold(
      // Persistent AppBar that never scrolls
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: themController.toggleTheme,
            icon: const Icon(Icons.sync),
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
                          auth.signOut();
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
            SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(auth.currentUser?.photoURL ??
                        'https://via.placeholder.com/150'),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    auth.currentUser?.displayName ?? 'msg_no_name'.tr,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    auth.currentUser?.email ?? 'msg_no_email'.tr,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                ListTile(
                  title: Text('lbl_about'.tr),
                  subtitle: const Text('Education enthusiast.'),
                ),
                const Divider(),
              ]),
            ),
          ];
        },
        // You tab view goes here
        body: const ProfileUploads(),
      ),
    );
  }
}
