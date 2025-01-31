import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../homepage/p/w/empty_item.dart';
import '../../homepage/p/w/loading.dart';
import '../../homepage/p/w/upcomming_feature.dart';
import '../do/entity/institute.dart';
import 'controllers/institute_controller.dart';
import 'w/assessment_tab_view.dart';
import 'w/courses_tab_view.dart';

class Institutepage extends GetWidget<InstituteController> {
  const Institutepage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO - BUG FOUND
    // hot reload results in null parameters,
    // found that this result in error in deubging,
    // Investigate whether this causes isssues in production.
    // The same issue is founded in various other pages that recive parameters through Get, and when hot reloads,
    // I'm postponed this now by thinking that this only affects at debugging and not in production.
    // Any how I need a clear reason to this issue.
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
                    '${'msg_error_loading_assessment'.tr} - ${snapshot.error}',
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const CustomProgressIndicator();
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
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () => controller.handleProfileSharing(),
                        ),
                      ],
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
                        ),
                        const SizedBox(height: 30),
                        _buildPhoneList(instituteData.phoneNumbers),
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
                            AssessmentTabBarView(instituteData),
                            CoursesTabBarView(instituteData),
                            const UpcomingFeature(featureName: 'Batches'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneList(List<String> phoneNumbers) {
    if (phoneNumbers.isEmpty) {
      return const EmptyItem(
        itemName: 'Phone Number',
      );
    }
    return SizedBox(
      height: 40.0, // Set your desired height here
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: phoneNumbers.length,
        itemBuilder: (context, index) {
          return IconButton(
            icon: Row(children: [
              const Icon(Icons.phone_rounded),
              Text(phoneNumbers[index]),
            ]),
            onPressed: () {
              launchUrl(Uri.parse('tel:${phoneNumbers[index]}'));
            },
          );
        },
      ),
    );
  }
}
