import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/find_friend_screen/controller.dart';

class FindFriendBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FindFriendController());
  }

}