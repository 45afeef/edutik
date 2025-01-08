import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../do/entity/institute.dart';
import 'controllers/institute_controller.dart';

class Institutepage extends GetWidget<InstituteController> {
  const Institutepage({super.key});

  @override
  Widget build(BuildContext context) {
    String instituteId = Get.parameters['instituteId']!;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
              future: controller.fetchInstitute(instituteId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Card(
                    child: Text(
                      '${'error_loading_assessment'.tr}.${snapshot.error}',
                    ),
                  );
                }
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                Institute instituteData = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(instituteData.profileUrl ??
                          'https://via.placeholder.com/150'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      instituteData.name ?? 'msg_no_name'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      instituteData.address,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
