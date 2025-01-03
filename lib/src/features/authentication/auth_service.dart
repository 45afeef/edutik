import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/routes.dart';

class AuthService {
  final RxBool _loggingState = false.obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isAuthenticated =
      FirebaseAuth.instance.currentUser?.isAnonymous == false;

  User? get currentUser => _firebaseAuth.currentUser;

  get onLoggingIn => _loggingState;

  void signIn() {
    if (kIsWeb) {
      print('Running on the web');
      signInWithGoogleInWeb().then((_) {
        _loggingState.value = false;
        Get.offAllNamed(AppRoute.home);
      }).catchError((onError) {
        _loggingState.value = false;
      });
    } else if (Platform.isAndroid) {
      print('Running on Android');

      _loggingState.value = true;
      signInWithGoogleInAndroid().then((_) {
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

  Future<UserCredential> signInWithGoogleInAndroid() async {
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

  Future<UserCredential> signInWithGoogleInWeb() async {
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

  void signOut() {
    FirebaseAuth.instance.signOut().then((_) {
      // TODO - This is not working well or not a good practice. Please make use of global stream listner to handle user auth state changes and navigation.
      Get.offAllNamed(AppRoute.home);
    });
  }
}
