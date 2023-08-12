
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/home_screen/controller.dart';
import 'package:kotha_boli/ui/screens/main_bottom_navigation/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainBottomNavBarController extends GetxController{
  FirebaseFirestore db=FirebaseFirestore.instance;
  var state=MainBottomNavigationState();

final HomeScreenController _homeScreenController=HomeScreenController();



  changeIndex(int index){
    state.index.value=index;
  }


}