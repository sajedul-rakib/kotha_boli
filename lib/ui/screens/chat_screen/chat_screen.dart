import 'dart:developer';

import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/routes/route_name/route_names.dart';
import 'package:kotha_boli/ui/screens/chat_screen/controller.dart';
import 'package:kotha_boli/ui/screens/chat_screen/image_view.dart';
import 'package:kotha_boli/ui/screens/home_screen/controller.dart';

class ChatScreen extends GetView<ChatScreenController> {
  ChatScreen({super.key});

  final TextEditingController _messageETController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.toNamed(RouteNames.PROFILEIMAGEVIEWER, parameters: {
                        'photoUrl': Get.parameters['friendPhotoUrl']!
                      });
                    },
                    shape: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    tileColor: Colors.black12,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                    leading: Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 3.0)),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(Get.parameters['friendPhotoUrl']!),
                      ),
                    ),
                    title: Text(
                      '${Get.parameters['friendName']}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    subtitle: const Text(
                      "Online",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Bubble(
                        stick: true,
                        alignment: Alignment.topRight,
                        nip: BubbleNip.rightBottom,
                        color: const Color.fromRGBO(212, 234, 244, 1.0),
                        child: const Text(
                          "Hello",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(Get.parameters['userPhotoUrl']!),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(Get.parameters['friendPhotoUrl']!),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Bubble(
                        stick: true,
                        alignment: Alignment.topRight,
                        nip: BubbleNip.leftBottom,
                        color: const Color.fromRGBO(212, 234, 244, 1.0),
                        child: const Text(
                          "How are you?",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: const Icon(
                      CupertinoIcons.photo,
                      size: 25,
                      color: Colors.black45,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: const Icon(
                      CupertinoIcons.mic_circle_fill,
                      size: 25,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                      width: 280,
                      height: 50,
                      child: TextField(
                        controller: _messageETController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black45),
                                borderRadius: BorderRadius.circular(45)),
                            hintText: 'Message',
                            suffixIcon: InkWell(
                              onTap: () {
                                if(_messageETController.text.isNotEmpty){
                                  controller.sentMsgToFriends(
                                      message: _messageETController.text.trim(),
                                      receiverId: Get.parameters['friendId']!.toString());
                                  _messageETController.clear();
                                }
                              },
                              child: const Icon(
                                CupertinoIcons.paperplane,
                                color: Colors.black45,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1.0, color: Colors.black45),
                                borderRadius: BorderRadius.circular(45))),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
