
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/sign_in_screen/state.dart';

class SignInScreenController extends GetxController {
  final state = SignInScreenState();

  SignInScreenController();

  Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String mobile}) async {
    final auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    try {
      final credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        await db.collection('users').add({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'mobile': mobile
        }).then((value) {
          Get.showSnackbar(GetSnackBar(
            title: 'Create user successfully',
            message: credential.user?.email.toString(),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ));
        });
      }
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Create user failed',
        message: e.message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ));
    }
  }
}
