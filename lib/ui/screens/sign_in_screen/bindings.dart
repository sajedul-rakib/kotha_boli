import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/sign_in_screen/controller.dart';

class SingInBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInScreenController>(() => SignInScreenController());
  }
}
