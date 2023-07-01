import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/splash_screen/index.dart';

class SplashScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}
