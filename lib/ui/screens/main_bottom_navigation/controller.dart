

import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/main_bottom_navigation/state.dart';

class MainBottomNavBarController extends GetxController{

  var state=MainBottomNavigationState();

  changeIndex(int index){
    state.index.value=index;
  }

}