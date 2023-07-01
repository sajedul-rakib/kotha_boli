import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/log_in_screen/index.dart';

class LogInScreenController extends GetxController {
  final state = LogInScreenState();

  LogInScreenController();

  Future<void> logIn({required String email, required String password}) async {
    final auth = FirebaseAuth.instance;

    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        log('log in successfully');
      });
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Log in failed',
        message: e.message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ));
    }
  }
}
