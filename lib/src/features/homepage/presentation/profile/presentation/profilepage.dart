import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/theme/theme_controller.dart';
import '../../../../authentication/auth_service.dart';
import 'controller.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    final ThemeController themController = Get.put(ThemeController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
              const Divider(),
              // const ListTile(
              //   leading: Icon(Icons.settings),
              //   title: Text('Settings'),
              //   subtitle: Text('Manage your account settings.'),
              // ),
              InkWell(
                onTap: themController.toggleTheme,
                child: ListTile(
                  leading: const Icon(Icons.sync),
                  title: Text('lbl_toggle_theme'.tr),
                ),
              ),
              InkWell(
                onTap: () {
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
                          ElevatedButton(
                              onPressed: Get.back,
                              child: Text("lbl_cancel".tr)),
                        ],
                        content: Text('msg_are_you_sure_to_logout'.tr),
                      );
                    },
                  );
                },
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text('lbl_logout'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
