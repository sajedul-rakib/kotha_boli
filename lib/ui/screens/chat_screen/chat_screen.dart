import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/home_screen/controller.dart';

import '../home_screen/image_url.dart';

class ChatScreen extends GetView<HomeScreenController> {
  const ChatScreen({super.key});

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
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(ImageUrl.profileImage),
                      ),
                    ),
                    title: const Text(
                      'Sajedul Islam Rakib',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
            Column(
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
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(ImageUrl.profileImage),
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
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(ImageUrl.profileImage),
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
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black45),
                                borderRadius: BorderRadius.circular(45)),
                            hintText: 'Message',
                            suffixIcon: const Icon(
                              CupertinoIcons.paperplane,
                              color: Colors.black45,
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
