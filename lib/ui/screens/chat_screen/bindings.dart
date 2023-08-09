import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/chat_screen/controller.dart';

class ChatScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatScreenController>(() => ChatScreenController());
  }
}
