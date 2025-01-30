import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/routing/approute.dart';
import '../homepage/p/profile/da/user_profile_model.dart';
import '../homepage/p/profile/do/repository/profile_repo.dart';

class AuthService {
  // Singleton instance
  static final AuthService _instance = AuthService._privateConstructor();

  final RxBool _loggingState = false.obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Factory constructor to return the singleton instance
  factory AuthService() {
    return _instance;
  }

  // Make this a private constructor
  AuthService._privateConstructor();

  User? get currentUser => _firebaseAuth.currentUser;

  // fields in singleton class behaive like final fields, so I have converted this to getter
  bool get isAuthenticated =>
      FirebaseAuth.instance.currentUser?.isAnonymous == false;

  bool get onLoggingIn => _loggingState.value;

  void signIn() {
    if (kIsWeb) {
      print('Running on the web');
      _signInWithGoogleInWeb().then((cred) {
        _loggingState.value = false;
        // SUGGESION - use auth listner for auth state changes instead of hardcoded routing on auth state changes.
        Get.offAllNamed(AppRoute.home);

        // create or update the userProfile
        _createOrUpdateUserProfile(cred);
      }).catchError((onError) {
        _loggingState.value = false;
      });
    } else if (Platform.isAndroid) {
      print('Running on Android');
      _loggingState.value = true;
      _signInWithGoogleInAndroid().then((cred) {
        _loggingState.value = false;
        // SUGGESION - use auth listner for auth state changes instead of hardcoded routing on auth state changes.
        Get.offAllNamed(AppRoute.home);

        // create or update the userProfile
        _createOrUpdateUserProfile(cred);
      }).catchError((onError) {
        _loggingState.value = false;
      });
    } else if (Platform.isIOS) {
      print('Running on iOS');
    } else if (Platform.isMacOS) {
      print('Running on macOS');
    } else if (Platform.isWindows) {
      print('Running on Windows');
    } else if (Platform.isLinux) {
      print('Running on Linux');
    } else {
      print('Running on an unknown platform');
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut().then((_) {
      // TODO - This is not working well or not a good practice. Please make use of global stream listener to handle user auth state changes and navigation.
      Get.offAllNamed(AppRoute.home);
    });
  }

  void _createOrUpdateUserProfile(UserCredential cred) {
    final UserProfileRepository userProfileRepo =
        Get.find<UserProfileRepository>();
    userProfileRepo.create(
      UserProfileModel(
        uid: cred.user!.uid,
        displayName: cred.user!.displayName ?? 'no name',
        photoURL: cred.user!.photoURL ?? 'no photo',
        email: cred.user!.email ?? 'no email',
      ),
    );
  }

  Future<UserCredential> _signInWithGoogleInAndroid() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await _firebaseAuth.signInWithCredential(credential);
  }

  Future<UserCredential> _signInWithGoogleInWeb() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }
}
