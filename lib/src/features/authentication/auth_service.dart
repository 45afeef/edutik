import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/routes.dart';

class AuthService {
  // Singleton instance
  static final AuthService _instance = AuthService._privateConstructor();

  final RxBool _loggingState = false.obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isAuthenticated =
      FirebaseAuth.instance.currentUser?.isAnonymous == false;

  // Factory constructor to return the singleton instance
  factory AuthService() {
    return _instance;
  }

  // Make this a private constructor
  AuthService._privateConstructor();

  User? get currentUser => _firebaseAuth.currentUser;

  get onLoggingIn => _loggingState;

  void signIn() {
    if (kIsWeb) {
      print('Running on the web');
      _signInWithGoogleInWeb().then((_) {
        _loggingState.value = false;
        Get.offAllNamed(AppRoute.home);
      }).catchError((onError) {
        _loggingState.value = false;
      });
    } else if (Platform.isAndroid) {
      print('Running on Android');
      _loggingState.value = true;
      _signInWithGoogleInAndroid().then((_) {
        _loggingState.value = false;
        Get.offAllNamed(AppRoute.home);
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
