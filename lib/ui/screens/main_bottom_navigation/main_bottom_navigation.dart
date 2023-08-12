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

  final List<Widget> _screens = [HomeScreen(), const ContactScreen()];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.state.index.value,
            onTap: (index) {
              controller.changeIndex(index);
            },
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_text),
                  label: 'Message'),
              BottomNavigationBarItem(
                  icon: Icon(
                      CupertinoIcons.person_crop_circle_fill_badge_checkmark),
                  label: 'Contacts'),
            ],
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              controller.changeIndex(index);
              _pageController.animateToPage(controller.state.index.value,
                  duration: const Duration(microseconds: 300),
                  curve: Curves.easeInBack);
            },
            children: _screens,
          ),
        ));
  }
}
