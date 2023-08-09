import 'package:get/get.dart';
import 'controller.dart';

class ContactScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactScreenController>(() => ContactScreenController());
  }
}
