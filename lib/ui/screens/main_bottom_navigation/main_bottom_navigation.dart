import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/main_bottom_navigation/controller.dart';
import '../contact/contact_screen.dart';
import '../home_screen/home_screen.dart';

class MainBottomNavBar extends GetView<MainBottomNavBarController> {
  MainBottomNavBar({
    super.key,
  });

  final List _screens=[
     HomeScreen(),
    const ContactScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.state.index.value,
        onTap: (index) {
          controller.changeIndex(index);
        },
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(
                  CupertinoIcons.person_crop_circle_fill_badge_checkmark),
              label: 'Contacts'),
        ],
      ),
      body: _screens[controller.state.index.value],
    ));
  }
}
