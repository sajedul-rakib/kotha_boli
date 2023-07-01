import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/routes/route_name/route_names.dart';
import 'package:kotha_boli/ui/screens/splash_screen/controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => Align(
              alignment: Alignment.bottomCenter,
              child: Stack(children: [
                PageView(
                  reverse: false,
                  onPageChanged: (index) {
                    controller.changePage(index);
                  },
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/chatting.png',
                            height: 400,
                            width: 400,
                          ),
                          const Text(
                            "কথা বলি",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/expand_network.png',
                            height: 400,
                            width: 400,
                          ),
                          const Text(
                            'Expand your network via Kotha Boli application and make a strong relationship',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black26,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/sign_up.png',
                            height: 320,
                            width: 320,
                          ),
                          const Text(
                            'So, why late! Join now with us',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black26,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: 160,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.cyan),
                                    elevation: MaterialStatePropertyAll(0)),
                                onPressed: () {
                                  Get.toNamed(RouteNames.SIGNINSCREEN);
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Join with Us',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.cyan),
                                    elevation: MaterialStatePropertyAll(0)),
                                onPressed: () async {
                                  controller.signInWithGoogle();
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sign with Google',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Icon(
                                      CupertinoIcons.game_controller,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DotsIndicator(
                    position: controller.state.index.value.toInt(),
                    decorator: DotsDecorator(
                        color: Colors.red,
                        activeColor: Colors.orange,
                        size: const Size.square(9),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                    dotsCount: 3,
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}
