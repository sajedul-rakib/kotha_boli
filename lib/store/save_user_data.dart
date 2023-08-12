import 'package:kotha_boli/routes/route_name/route_names.dart';
import 'package:kotha_boli/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SaveUserData {

  static Future<void> saveUserToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
  }

  static Future<void> saveUserData(LogInUserResponseEntity userData)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("name", userData.displayName.toString());
    sharedPreferences.setString("email", userData.email.toString());
    sharedPreferences.setString("photoUrl", userData.photoUrl.toString());
    sharedPreferences.setString('id', userData.id.toString());
  }

  Future<bool> isUserAreLogged() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userToken = sharedPreferences.getString('token');
    if (userToken != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logoutUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAllNamed(RouteNames.LOGIN);
  }
}
