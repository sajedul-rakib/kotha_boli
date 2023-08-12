import 'package:cloud_firestore/cloud_firestore.dart';



class LogInUserResponseEntity {
  String? id;
  String? displayName;
  String? email;
  String? photoUrl;
  List<String>? friends;


  LogInUserResponseEntity(
      {this.id, this.displayName, this.email, this.photoUrl,this.friends});

  factory LogInUserResponseEntity.fromJson(Map<String, dynamic> json) =>
      LogInUserResponseEntity(
          id: json['access_token'],
          displayName: json['display_name'],
          email: json['email'],
          friends: ['friends'],
          photoUrl: json['photo_url']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'display_name': displayName,
    'friends':friends,
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
  DateTime? createAt;
  List<String>? friends;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.photoUrl,
      this.location,
      this.fcmToken,
      this.createAt,
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
      createAt: data?['createAt'],
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
      if (createAt != null) "addTime": createAt,
      if (friends != null) "friends": friends,
    };
  }
}




// class ConfigureStore{
//   String token='';
//   final _isLogIn=false.obs;
//   final _profile=LogInUserResponseEntity().obs;
//
//   static ConfigureStore get to => Get.find();
//
//   bool get isLogIn =>_isLogIn.value;
//   LogInUserResponseEntity get profile=>_profile.value;
//
//   checkUserAreLogged() async {
//     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
//     final isFoundToken=sharedPreferences.getString('token');
//     if(isFoundToken?.isNotEmpty ?? true){
//       return true;
//     }else{
//       return false;
//     }
//   }
//
//   //save user token
//    setToken(String token) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.setString('token', token);
//     token=token;
//   }
//
//   //save user profile
//    saveProfile(LogInUserResponseEntity profile)async{
//     if(profile.accessToken!.isNotEmpty){
//       setToken(profile.accessToken!);
//     }
//   }
// }
