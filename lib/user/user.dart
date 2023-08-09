import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogInUserResponseEntity {
  String? accessToken;
  String? displayName;
  String? email;
  String? photoUrl;


  LogInUserResponseEntity(
      {this.accessToken, this.displayName, this.email, this.photoUrl});

  factory LogInUserResponseEntity.fromJson(Map<String, dynamic> json) =>
      LogInUserResponseEntity(
          accessToken: json['access_token'],
          displayName: json['display_name'],
          email: json['email'],
          photoUrl: json['photo_url']);

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'display_name': displayName,
    'email': email,
    'photo_url': photoUrl,
    'createAt':DateTime.now()
  };

}

class UserData {
  String? id;
  String? name;
  String? email;
  String? photoUrl;
  String? location;
  String? fcmToken;
  Timestamp? addTime;
  List<String>? friends;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.photoUrl,
      this.location,
      this.fcmToken,
      this.addTime,
      this.friends});

  factory UserData.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return UserData(
      id: data?['id'],
      name: data?['name'],
      email: data?['email'],
      photoUrl: data?['photoUrl'],
      location: data?['location'],
      addTime: data?['addTime'],
      friends: data?['friends']
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (photoUrl != null) "photoUrl": photoUrl,
      if (fcmToken != null) "fcmToken": fcmToken,
      if (addTime != null) "addTime": addTime,
      if (addTime != null) "friends": friends,
    };
  }
}

class UserStore {
  bool USER_ARE_LOGGED = false;


  
}


class ConfigureStore{
  String token='';
  final _isLogIn=false.obs;
  final _profile=LogInUserResponseEntity().obs;

  static ConfigureStore get to => Get.find();

  bool get isLogIn =>_isLogIn.value;
  LogInUserResponseEntity get profile=>_profile.value;

  checkUserAreLogged() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    final isFoundToken=sharedPreferences.getString('token');
    if(isFoundToken?.isNotEmpty ?? true){
      return true;
    }else{
      return false;
    }
  }

  //save user token
   setToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
    token=token;
  }
  
  //save user profile
   saveProfile(LogInUserResponseEntity profile)async{
    if(profile.accessToken!.isNotEmpty){
      setToken(profile.accessToken!);
    }
  }
}
