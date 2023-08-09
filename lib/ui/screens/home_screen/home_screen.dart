import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/routes/route_name/route_names.dart';
import 'package:kotha_boli/ui/screens/home_screen/controller.dart';
import 'package:kotha_boli/ui/screens/home_screen/image_url.dart';

import '../widgets/side_drawer.dart';

class HomeScreen extends GetView<HomeScreenController> {
  HomeScreen({super.key});

  final TextEditingController _findFriendETController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title:
                              const Text("Find your friends by email & name:"),
                          titleTextStyle: const TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SearchBar(
                                controller: _findFriendETController,
                                leading: const Icon(CupertinoIcons.person_2),
                                hintText: "Enter your friends email / name",
                                elevation: const MaterialStatePropertyAll(0),
                                shape: const MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        side: BorderSide(
                                            width: 1, color: Colors.black))),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_findFriendETController
                                          .text.isNotEmpty) {
                                        _findFriendETController.clear();
                                        Get.back();
                                      } else {
                                        Get.back();
                                      }
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red)),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_findFriendETController
                                          .text.isNotEmpty) {
                                        Get.toNamed(
                                            RouteNames.FINDFRIENDSCREEN);
                                      } else {
                                        Get.showSnackbar(const GetSnackBar(
                                          title: "Error",
                                          message:
                                              'Enter your friends email / name!',
                                        ));
                                      }
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.green)),
                                    child: const Text(
                                      "Search",
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
                child: const Icon(
                  CupertinoIcons.person_add_solid,
                  size: 35,
                  color: Colors.black,
                )),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              CupertinoIcons.list_bullet_indent,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        title: const Text(
          "Messages",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   width: double.infinity,
              //   height: 70,
              //   color: Colors.transparent,
              //   child: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 32),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SearchBar(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(Colors.black12),
                  leading: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(CupertinoIcons.search),
                  ),
                  hintText: 'Search',
                  hintStyle: MaterialStatePropertyAll(
                      TextStyle(fontSize: 16, color: Colors.black45)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 575,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(
                              RouteNames.CHATSCREEN,
                            );
                          },
                          shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: Colors.black12,
                          leading: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: index % 2 == 0
                                        ? Colors.green
                                        : Colors.black26,
                                    width: 3.0)),
                            child: const CircleAvatar(
                              backgroundImage:
                                  NetworkImage(ImageUrl.profileImage),
                            ),
                          ),
                          title: const Text(
                            'Sajedul Islam Rakib',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          subtitle: const Text('Hey! Sajedul How are you?'),
                          trailing: Text(
                              '${DateTime.now().hour}:${DateTime.now().minute}'),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}


