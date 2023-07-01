import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kotha_boli/routes/route_pages/route.dart';
import 'package:kotha_boli/shared/constrains.dart';
import 'package:flutter/foundation.dart';
import 'package:kotha_boli/utils/colors/app_color/app_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constrains.apiKey,
            appId: Constrains.appId,
            messagingSenderId: Constrains.messagingSenderId,
            projectId: Constrains.projectId));
  }else{
    await Firebase.initializeApp();
  }
  runApp(const KothaBoli());
}

class KothaBoli extends StatelessWidget {
  const KothaBoli({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
         fontFamily: GoogleFonts.lato().fontFamily,
         elevatedButtonTheme:   ElevatedButtonThemeData(
           style:  ButtonStyle(
             backgroundColor: MaterialStatePropertyAll(primaryColor),
             textStyle: const MaterialStatePropertyAll(TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 20,
               color: Colors.white
             ))
           )
         ),

       ),
       initialRoute: RoutePages.INITIAL,
       getPages: RoutePages.routes,
       // home: const Scaffold(
       //   body: SplashScreen(),
       // ),
    );
  }
}
