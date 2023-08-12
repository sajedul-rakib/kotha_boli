import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SizedBox(
              height: 300,
              width: 300,
              child: Image.network(Get.parameters['photoUrl']!,fit: BoxFit.contain,)),
        ),
      ),
    );
  }
}
