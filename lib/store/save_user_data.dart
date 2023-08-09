
import 'package:shared_preferences/shared_preferences.dart';

class SaveUserData{


  Future<void>saveUserToken(String token)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
  }

  Future<void> logoutUser()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

}