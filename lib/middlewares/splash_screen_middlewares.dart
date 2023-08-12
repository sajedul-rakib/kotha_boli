//
//
// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:kotha_boli/routes/route_name/route_names.dart';
// import 'package:kotha_boli/user/user.dart';
//
// class SplashScreenMiddlewares extends GetMiddleware{
//   @override
//   int? priority =0;
//
//   SplashScreenMiddlewares({required this.priority});
//
//   @override
//   RouteSettings? redirect(String? route){
//     if(ConfigureStore.to.isLogIn){
//       return const RouteSettings(name:  RouteNames.HOMESCREEN);
//     }else{
//       return const RouteSettings(name: RouteNames.LOGIN);
//     }
//   }
//
//
//
// }