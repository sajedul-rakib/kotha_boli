import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kotha_boli/ui/screens/splash_screen/state.dart';

class SplashScreenController extends GetxController {
  final state = SplashScreenState();

  SplashScreenController();

  changePage(int index) {
    state.index.value = index;
  }

  Future<void> signInWithGoogle() async {
    final response = await GoogleSignIn().signIn();

    final googleAuth = await response?.authentication;
    //create a new credential
    if (googleAuth != null) {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      FirebaseAuth.instance.signInWithCredential(credential);
    }
  }
}
