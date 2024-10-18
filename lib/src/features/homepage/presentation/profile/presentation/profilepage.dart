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
                  auth.currentUser?.displayName ?? 'profile_no_name'.tr,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  auth.currentUser?.email ?? 'profile_no_email'.tr,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text('about'.tr),
                subtitle: const Text('Education enthusiast.'),
              ),
              // const ListTile(
              //   leading: Icon(Icons.settings),
              //   title: Text('Settings'),
              //   subtitle: Text('Manage your account settings.'),
              // ),
              InkWell(
                onTap: themController.toggleTheme,
                child: const ListTile(
                  leading: Icon(
                    Icons.sync,
                  ),
                  title: Text('Toggle Theme'),
                ),
              ),
              InkWell(
                onTap: auth.signOut,
                child: const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
