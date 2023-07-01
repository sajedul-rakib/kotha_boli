import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/log_in_screen/controller.dart';

class LogInBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogInScreenController>(() => LogInScreenController());
  }
}
