import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/contact/index.dart';
import 'package:kotha_boli/ui/screens/home_screen/controller.dart';
import 'package:kotha_boli/ui/screens/main_bottom_navigation/controller.dart';

class BottomNavBarBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainBottomNavBarController>(() => MainBottomNavBarController());
    Get.put(HomeScreenController());
    Get.put(ContactScreenController());
  }
}
