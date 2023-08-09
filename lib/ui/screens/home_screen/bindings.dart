import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/home_screen/controller.dart';

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}
