import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../utils/routing/approute.dart';
import '../../../assessment/do/assessment.dart';
import '../../../assessment/p/controllers/assessment_controller.dart';
import '../../../homepage/do/content.dart';
import '../../do/entity/institute.dart';
import '../../do/repo/institute_repo.dart';

class InstituteController extends GetxController {
  final InstituteRepository _repo = Get.find<InstituteRepository>();

  /// Holds the current assessment being taken
  Rx<Institute> institute = Institute.empty().obs;
  Map<String, Institute> instituteCache = <String, Institute>{};

  Future<Institute> fetchInstitute(String instituteId) async {
    // Check if the institute is already in the cache
    if (instituteCache.containsKey(instituteId)) {
      return instituteCache[instituteId]!;
    }

    // If not in the cache, make the network request
    Institute response = await _repo.getInstitute(instituteId);

    // Update the cache with the new response
    instituteCache[instituteId] = response;

    // Update the current institute
    institute.value = response;

    return response;
  }

  Future<List<Assessment>> fetchInstitutesAssessments() async {
    return Get.find<AssessmentController>().fetchAllAssessments(
      institute.value.id!,
      UserType.institute,
    );
  }

  void handleProfileSharing() {
    Share.share(
      '''Visit this profile of *${institute.value.name} in Edukit*


here is the link
https://edutik.web.app${AppRoute.institutePage.replaceFirst(':instituteId', '${institute.value.id}')}

You can attempt free public exams here.
''',
    );

    Clipboard.setData(ClipboardData(
        text: 'Check out this institute: ${institute.value.name}'));
    Get.snackbar('Share', 'Institute link copied to clipboard');
  }
}
