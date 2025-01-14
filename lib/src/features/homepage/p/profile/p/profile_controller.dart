import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../assessment/p/controllers/assessment_controller.dart';
import '../../../../authentication/auth_service.dart';
import '../do/entity/user_profile.dart';
import '../do/repository/profile_repo.dart';

class ProfileController extends GetxController {
  final UserProfileRepository _repo = Get.find<UserProfileRepository>();

  Map<String, UserProfile> userProfileCache = <String, UserProfile>{};
  Rx<UserProfile> userProfile = UserProfile.empty().obs;
  bool _isOwnProfile = true;

  final AuthService auth = AuthService();
  late AssessmentController assessmentController;

  bool get isOwnProfile => _isOwnProfile;

  Future<UserProfile> fetchProfile(String? profileId) async {
    _isOwnProfile = profileId == null ||
        (auth.currentUser != null && profileId == auth.currentUser!.uid);

    profileId ??= auth.currentUser!.uid;

    // Check if the user profile is already in the cache
    if (userProfileCache.containsKey(profileId)) {
      userProfile.value = userProfileCache[profileId]!;
      return userProfile.value;
    }

    UserProfile response;
    if (_isOwnProfile) {
      response = UserProfile(
        uid: auth.currentUser!.uid,
        displayName: auth.currentUser!.displayName ?? '',
        photoURL: auth.currentUser!.photoURL ?? '',
        email: auth.currentUser!.email ?? '',
      );
    } else {
      // If not in the cache, make the network request
      response = await _repo.fetchProfile(profileId);
    }

    // Update the cache with the new response
    userProfileCache[profileId] = response;

    // Update the current institute
    userProfile.value = response;

    return response;
  }

  handleProfileSharing(String? profileId) {
    Share.share(
      '''Visit this profile of *${userProfile.value.displayName} in Edukit*

here is the link
https://edutik.web.app${AppRoute.publicProfilePage.replaceFirst(':uid', profileId ?? auth.currentUser!.uid)}
''',
    );
  }

  @override
  void onInit() {
    super.onInit();
    assessmentController = Get.put(AssessmentController());
  }
}
