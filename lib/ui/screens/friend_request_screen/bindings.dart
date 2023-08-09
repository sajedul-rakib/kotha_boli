
import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/friend_request_screen/controller.dart';

class FriendRequestBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FriendRequestController());
  }

}