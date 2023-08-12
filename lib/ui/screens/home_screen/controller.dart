import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/data/friends_data_model/friends_data_model.dart';
import 'package:kotha_boli/ui/screens/log_in_screen/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  final state = LogInScreenState();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  FriendsDetailModel _friendsDetailModel = FriendsDetailModel();
  FriendsDetailModel _findFriendsDetailModel = FriendsDetailModel();
  bool _homeScreenInProgress = false;

  final Map<String,String> _userDetails={
    'name':'',
    'email':'',
    'photoUrl':'',
    'id':''
  };
  var findFriends = {'friends': []};

  bool get homeScreenInProgress => _homeScreenInProgress;
  Map<String,String> get userDetails=>_userDetails;
  FriendsDetailModel get friendsDetailModel => _friendsDetailModel;

  HomeScreenController();

  Future<void> getAllFriends() async {
    _homeScreenInProgress = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userID = sharedPreferences.getString('token');
    _db.collection('users').where('id', isEqualTo: userID).get().then((user) {
      _homeScreenInProgress = false;
      log(jsonEncode(user.docs.first.get('friends')).toString());
      _friendsDetailModel =
          FriendsDetailModel.fromJson(user.docs.first.get('friends'));
    });
    _homeScreenInProgress = false;
  }

  Future findFriend(String email) async {
    _db
        .collection('users')
        .get()
        .then((user) =>
            user.docs.where((element) => element.get('email') == email))
        .then((value) {
      for (var details in value) {
        findFriends['friends']!.add(details.data());
      }
    });
    _findFriendsDetailModel=FriendsDetailModel.fromJson(findFriends);
  }

 Future<void> getUserData()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String email=sharedPreferences.getString('email')!;
    String name=sharedPreferences.getString('name')!;
    String photoUrl=sharedPreferences.getString('photoUrl')!;
    String id=sharedPreferences.getString('id')!;

    _userDetails['name']=name;
    _userDetails['email']=email;
    _userDetails['photoUrl']=photoUrl;
    _userDetails['id']=id;
  }

  @override
  void onInit() {
    getUserData();
    getAllFriends();
    super.onInit();
  }
}
