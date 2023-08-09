import 'dart:developer';

import 'package:get/get.dart';
import 'package:kotha_boli/routes/route_name/route_names.dart';
import 'package:kotha_boli/ui/screens/home_screen/home_screen.dart';
import 'package:kotha_boli/ui/screens/splash_screen/index.dart';
import 'package:kotha_boli/ui/screens/splash_screen/state.dart';
import 'package:kotha_boli/user/user.dart';

class SplashScreenController extends GetxController {
  final state = SplashScreenState();

  bool userAreLoggedIn = false;

  SplashScreenController();

  changePage(int index) {
    state.index.value = index;
  }

}
