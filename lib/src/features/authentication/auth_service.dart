import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/routing/approute.dart';
import '../homepage/p/profile/da/user_profile_model.dart';
import '../homepage/p/profile/do/repository/profile_repo.dart';

/// Service for handling authentication using Firebase.
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

  /// Gets the current authenticated user.
  User? get currentUser => _firebaseAuth.currentUser;

  /// Checks if the user is authenticated.
  bool get isAuthenticated =>
      FirebaseAuth.instance.currentUser?.isAnonymous == false;

  /// Checks if the user is currently logging in.
  bool get onLoggingIn => _loggingState.value;

  /// Signs in the user using Google Sign-In.
  void signIn() {
    if (kIsWeb) {
      print('Running on the web');
      _signInWithGoogleInWeb().then((cred) {
        _loggingState.value = false;
        // Suggestion: use auth listener for auth state changes instead of hardcoded routing on auth state changes.
        Get.offAllNamed(AppRoute.home);

        // Create or update the user profile
        _createOrUpdateUserProfile(cred);
      }).catchError((onError) {
        _loggingState.value = false;
      });
    } else if (Platform.isAndroid) {
      print('Running on Android');
      _loggingState.value = true;
      _signInWithGoogleInAndroid().then((cred) {
        _loggingState.value = false;
        // Suggestion: use auth listener for auth state changes instead of hardcoded routing on auth state changes.
        Get.offAllNamed(AppRoute.home);

        // Create or update the user profile
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

  /// Signs out the current user.
  void signOut() {
    FirebaseAuth.instance.signOut().then((_) {
      // TODO: This is not working well or not a good practice. Please make use of global stream listener to handle user auth state changes and navigation.
      Get.offAllNamed(AppRoute.home);
    });
  }

  /// Creates or updates the user profile in the database.
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

  /// Signs in the user using Google Sign-In on Android.
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

  /// Signs in the user using Google Sign-In on the web.
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
