class UserProfile {
  final String displayName;
  final String photoURL;
  final String email;

  UserProfile({
    required this.displayName,
    required this.photoURL,
    required this.email,
  });

  factory UserProfile.empty() => UserProfile(
        displayName: '',
        photoURL: '',
        email: '',
      );
}
