import 'package:get/get.dart';

import '../../../../assessment/p/controllers/assessment_controller.dart';

class ProfileController extends GetxController {
  // Define the necessary variables and methods for the profile page

  final RxString userName = ''.obs;
  final RxString userEmail = ''.obs;
  final RxString userProfilePic = ''.obs;

  // Controllers declarations
  late AssessmentController assessmentController;

  void loadProfile() {
    // TODO - add repository Logic to load profile details
    userName.value = 'John Doe';
    userEmail.value = 'john.doe@example.com';
    userProfilePic.value = 'https://example.com/johndoe.jpg';
  }

  @override
  void onInit() {
    super.onInit();

    assessmentController = Get.put(AssessmentController());

    loadProfile();
  }

  void updateProfile(String name, String email, String profilePic) {
    userName.value = name;
    userEmail.value = email;
    userProfilePic.value = profilePic;
  }
}
