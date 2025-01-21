import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/routing/approute.dart';
import '../do/entity/user_profile.dart';

class ProfileInfo extends StatelessWidget {
  final UserProfile user;

  const ProfileInfo({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.photoURL),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            user.displayName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            user.email,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ),
        const SizedBox(height: 20),
        if (user.accessInstitutes != null && user.accessInstitutes!.isNotEmpty)
          Row(
            children: user.accessInstitutes!.map(
              (instituteId) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () => Get.toNamed(
                            AppRoute.institutePage
                                .replaceFirst(':instituteId', instituteId),
                          ),
                      child: Text(instituteId)),
                );
              },
            ).toList(),
          ),
        const Divider(),
        ListTile(
          title: Text('lbl_about'.tr),
          subtitle: const Text('Education enthusiast.'),
        ),
        const Divider(),
      ]),
    );
  }
}
