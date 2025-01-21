import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../homepage/p/w/upcomming_feature.dart';
import '../do/entity/institute.dart';
import 'controllers/institute_controller.dart';

class AssessmentTab extends StatelessWidget {
  final List<String>? assessmentRefs;
  const AssessmentTab(this.assessmentRefs, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: assessmentRefs?.length,
      itemBuilder: (BuildContext context, int index) {
        final assessmentId = assessmentRefs?[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              leading: Text('${index + 1}'),
              title: const Text('Public Assessment'),
              onTap: () {
                // Navigate to the assessment page
                Navigator.pushNamed(
                  context,
                  '/assessmentPage/$assessmentId',
                );
              },
            ),
          ),
        );
      },
    );
  }
}

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
                return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        expandedHeight: 200.0,
                        floating: false,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Image.network(
                            instituteData.profileUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
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
                          )
                        ]),
                      )
                    ];
                  },
                  body: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(text: 'Assessment'),
                            Tab(text: 'Courses'),
                            Tab(text: 'Batches'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              AssessmentTab(instituteData.publicAssessmentRefs),
                              const UpcomingFeature(featureName: 'Courses'),
                              const UpcomingFeature(featureName: 'Batches'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
