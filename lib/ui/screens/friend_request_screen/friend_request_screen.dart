import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screen/image_url.dart';

class FriendRequestScreen extends StatelessWidget {
  const FriendRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(
            CupertinoIcons.chat_bubble_2,
            size: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          "Message Requests",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
        ),
        titleSpacing: 0,
      ),
      // body: const Center(
      //   child: SizedBox(
      //       width: 100,
      //       height: 100,
      //       child: CircularProgressIndicator(
      //         color: Colors.black45,
      //       )),
      // ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              "Confirm friend request"),
                          titleTextStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                        MaterialStatePropertyAll(
                                            Colors.red)),
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: const ButtonStyle(
                                        backgroundColor:
                                        MaterialStatePropertyAll(
                                            Colors.green)),
                                    child: const Text(
                                      "Accept Request",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                },
                shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Colors.black12,
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(ImageUrl.profileImage),
                ),
                title: const Text(
                  'Sajedul Islam Rakib',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            );
          }),
    );
  }
}
