import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/routes/route_name/route_names.dart';
import 'package:kotha_boli/ui/screens/home_screen/home_screen.dart';
import 'package:kotha_boli/ui/screens/log_in_screen/controller.dart';
import 'package:kotha_boli/ui/screens/widgets/app_text_form_field.dart';
import 'package:kotha_boli/utils/colors/app_color/app_color.dart';

class LogInScreen extends GetView<LogInScreenController> {
  LogInScreen({super.key});

  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: ()async{
                     final response=await controller.signInWithGoogle();
                     if(response){
                       Get.offAllNamed(RouteNames.MAINBOTTOMNAVIGATION);
                     }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 200,
                      height: 60,
                      child: const Center(
                        child: Text(
                          "Log in with Google",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppTextFormField(
                          textEditingController: _emailETController,
                          hintText: 'Enter your email',
                          prefixIcon: CupertinoIcons.person_alt_circle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextFormField(
                          textEditingController: _passwordETController,
                          hintText: 'Password',
                          obscureText: true,
                          prefixIcon: CupertinoIcons.lock,
                          suffixIcon: CupertinoIcons.eye,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                     await controller.logIn(
                          email: _emailETController.text.trim(),
                          password: _passwordETController.text);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(primaryColor)),
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black26,
                            fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(RouteNames.SIGNINSCREEN);
                        },
                        child: const Text('Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
