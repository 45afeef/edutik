import 'package:firebase_auth/firebase_auth.dart';
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
    _loggingState.value = true;
    signInWithGoogle().then((_) {
      _loggingState.value = false;
      Get.offAllNamed(AppRoute.home);
    }).catchError((onError) {
      _loggingState.value = false;
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
            clientId: const String.fromEnvironment('GOOGLE_CLIENT_ID'))
        .signIn();
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

  void signOut() {
    FirebaseAuth.instance.signOut().then((_) {
      // TODO - This is not working well or not a good practice. Please make use of global stream listner to handle user auth state changes and navigation.
      Get.offAllNamed(AppRoute.home);
    });
  }
}
