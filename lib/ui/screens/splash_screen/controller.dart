import 'dart:developer';

import 'package:get/get.dart';
import 'package:kotha_boli/routes/route_name/route_names.dart';
import 'package:kotha_boli/store/save_user_data.dart';
import 'package:kotha_boli/ui/screens/home_screen/home_screen.dart';
import 'package:kotha_boli/ui/screens/splash_screen/index.dart';
import 'package:kotha_boli/ui/screens/splash_screen/state.dart';

class SplashScreenController extends GetxController {
  final state = SplashScreenState();

  SplashScreenController();

  changePage(int index) {
    state.index.value = index;
  }


  Future<void>checkUserLogged()async{
    bool getUser=await SaveUserData().isUserAreLogged();
    if(getUser){
      Get.offAllNamed(RouteNames.MAINBOTTOMNAVIGATION);
    }else{
      Get.offAllNamed(RouteNames.LOGIN);
    }
  }


  @override
  void onReady() {
    checkUserLogged();
    super.onReady();
  }

}
