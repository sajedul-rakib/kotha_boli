import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kotha_boli/store/save_user_data.dart';
import 'package:kotha_boli/ui/screens/log_in_screen/index.dart';
import '../../../user/user.dart';

class LogInScreenController extends GetxController {
  final state = LogInScreenState();

  final _googleSignIn = GoogleSignIn();
  final db = FirebaseFirestore.instance;
   List<String> userFriends=[];

  LogInScreenController();

  final auth = FirebaseAuth.instance;

  Future<void> logIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Log in failed',
        message: e.message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ));
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();

      if (user != null) {
        final googleAuth = await user.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        FirebaseAuth.instance.signInWithCredential(credential);

        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? '';

        LogInUserResponseEntity userProfile = LogInUserResponseEntity();
        userProfile.displayName = displayName;
        userProfile.email = email;
        userProfile.id = id;
        userProfile.photoUrl = photoUrl;

        SaveUserData.saveUserToken(id);
        SaveUserData.saveUserData(userProfile);



        var userBase = await db
            .collection('users')
            .withConverter(
                fromFirestore: UserData.fromFireStore,
                toFirestore: (UserData userData, options) =>
                    userData.toFireStore())
            .where('id', isEqualTo: id)
            .get();
        if (userBase.docs.isEmpty) {
          final data = UserData(
              id: id,
              name: displayName,
              email: email,
              photoUrl: photoUrl,
              location: '',
              fcmToken: '',
              friends: [],
              createAt: DateTime.now());

          await db
              .collection('users')
              .withConverter(
                  fromFirestore: UserData.fromFireStore,
                  toFirestore: (UserData userData, options) =>
                      userData.toFireStore())
              .add(data);
        }
        return true;
      }
      return false;
    }on FirebaseAuthException catch(e) {
      log(e.message.toString());
      log(e.toString());
      log(e.code.toString());
      return false;
    }
  }
}
