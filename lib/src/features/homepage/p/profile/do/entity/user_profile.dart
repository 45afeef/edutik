class UserProfile {
  final String? uid;
  final String displayName;
  final String photoURL;
  final String email;
  final List<String>? accessInstitutes;

  UserProfile({
    this.uid,
    required this.displayName,
    required this.photoURL,
    required this.email,
    this.accessInstitutes,
  });

  factory UserProfile.empty() => UserProfile(
        displayName: '',
        photoURL: '',
        email: '',
      );
}
