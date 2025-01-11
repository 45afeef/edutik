import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/routes.dart';
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
          child: FutureBuilder<Institute>(
              future: controller.fetchInstitute(instituteId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Card(
                    child: Text(
                      '${'error_loading_assessment'.tr} - ${snapshot.error}',
                    ),
                  );
                }
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                Institute instituteData = snapshot.data!;
                return Column(
                  children: [
                    Image.network(
                      instituteData.profileUrl,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      instituteData.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      instituteData.address,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final assessmentId =
                              instituteData.publicAssessmentRefs![2];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: AspectRatio(
                                aspectRatio: 3.0,
                                child: Center(
                                  child: ListTile(
                                    leading: Text('${index + 1}'),
                                    title: Text(
                                        '${'public'.tr} ${'assessment'.tr}'),
                                    onTap: () => Get.toNamed(
                                      AppRoute.assessmentPage
                                          .replaceFirst(':id', assessmentId),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        // itemCount: instituteData.publicAssessmentRefs!.length,
                        itemCount: 500,
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
