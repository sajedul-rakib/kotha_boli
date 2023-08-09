import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kotha_boli/routes/route_name/route_names.dart';
import 'package:kotha_boli/ui/screens/sign_in_screen/controller.dart';
import 'package:kotha_boli/utils/colors/app_color/app_color.dart';
import 'package:get/get.dart';

import '../widgets/app_text_form_field.dart';

class SignInScreen extends GetView<SignInScreenController> {
   SignInScreen({super.key});

  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
  final TextEditingController _firstNameETController = TextEditingController();
  final TextEditingController _lastNameETController = TextEditingController();
  final TextEditingController _mobileETController = TextEditingController();
  final TextEditingController _photoETController = TextEditingController();
  final TextEditingController _confirmPasswordETController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  XFile? pickedImage;

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
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      child: Icon(
                        CupertinoIcons.person,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                final ImagePicker picker = ImagePicker();
                                AlertDialog(
                                    title: const Text('Take photo from: '),
                                    content: Column(
                                      children: [
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      pickedImage = await picker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                      if (pickedImage != null) {
                                                       _photoETController.text= pickedImage!.name
                                                            .replaceAll(
                                                                pickedImage!
                                                                    .name
                                                                    .split('.')
                                                                    .first,
                                                                '${_lastNameETController.text.toLowerCase().trim()}_${DateTime.now()}');
                                                      }
                                                    },
                                                    child: Container(
                                                        width: 60,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.black12,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: const Icon(
                                                            CupertinoIcons
                                                                .camera)),
                                                  ),
                                                  const Text('Camera')
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 60,
                                              ),
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      pickedImage = await picker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                      if (pickedImage != null) {
                                                        _photoETController
                                                                .text =
                                                            pickedImage!.name
                                                                .replaceAll(
                                                                    pickedImage!
                                                                        .name
                                                                        .split(
                                                                            '.')
                                                                        .first,
                                                                    '${_lastNameETController.text.toLowerCase().trim()}_${DateTime.now()}');
                                                      }
                                                    },
                                                    child: Container(
                                                        width: 60,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.black12,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: const Icon(
                                                            CupertinoIcons
                                                                .photo)),
                                                  ),
                                                  const Text('Gallery')
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ));
                              },
                              child: Container(
                                width: 100,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: const Center(
                                    child: Text(
                                  'Photo',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                            ),
                            Expanded(
                                child: TextFormField(
                              readOnly: true,
                              enabled: false,
                              controller: _photoETController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)))),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextFormField(
                          hintText: "First name",
                          prefixIcon: CupertinoIcons.person_alt_circle,
                          keyBoardType: TextInputType.text,
                          textEditingController: _firstNameETController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Enter your first name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextFormField(
                          hintText: "Last name",
                          prefixIcon: CupertinoIcons.person_alt_circle,
                          keyBoardType: TextInputType.text,
                          textEditingController: _lastNameETController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Enter your last name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextFormField(
                          hintText: "Email",
                          prefixIcon: CupertinoIcons.mail,
                          keyBoardType: TextInputType.emailAddress,
                          textEditingController: _emailETController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Enter your email";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextFormField(
                          hintText: "Mobile",
                          prefixIcon: CupertinoIcons.phone_circle,
                          keyBoardType: TextInputType.phone,
                          textEditingController: _mobileETController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Enter your mobile";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextFormField(
                          hintText: "Password",
                          prefixIcon: CupertinoIcons.lock,
                          suffixIcon: CupertinoIcons.eye,
                          obscureText: true,
                          textEditingController: _passwordETController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Enter a unique password at least 6 character";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextFormField(
                          hintText: "Confirm Password",
                          prefixIcon: CupertinoIcons.lock,
                          suffixIcon: CupertinoIcons.eye,
                          obscureText: true,
                          textEditingController: _confirmPasswordETController,
                          validation: (value) {
                            if (value!.isNotEmpty) {
                              if (value != _passwordETController.text) {
                                return 'Password don\'t match';
                              } else {
                                return value.length < 6
                                    ? 'Password should be minimum 6 character'
                                    : null;
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? true) {
                        controller.signInWithEmailAndPassword(
                            email: _emailETController.text.trim(),
                            password: _passwordETController.text,
                            firstName: _firstNameETController.text.trim(),
                            lastName: _lastNameETController.text.trim(),
                            mobile: _mobileETController.text.trim());
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(primaryColor)),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black26,
                            fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(RouteNames.LOGIN);
                        },
                        child: const Text('Log in',
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
