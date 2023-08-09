import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/main_bottom_navigation/controller.dart';

class BottomNavBarBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainBottomNavBarController>(() => MainBottomNavBarController());
  }
}
