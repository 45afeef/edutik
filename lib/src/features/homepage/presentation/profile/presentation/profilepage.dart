import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../authentication/auth_service.dart';
import 'controller.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Profile page"),
          ElevatedButton(
            onPressed: () {
              auth.signOut();
            },
            child: const Text('Sign Out'),
          )
        ],
      ),
    );
  }
}
