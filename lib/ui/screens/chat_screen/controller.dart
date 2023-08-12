import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/chat_screen/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreenController extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final state = ChatScreenState();

  sentMsgToFriends(
      {required String message, required String receiverId}) async {
    log('sending message to $receiverId ');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? senderId = sharedPreferences.getString('token');
    Map<String, dynamic> msg = {
      "from": senderId.toString(),
      "to": receiverId.toString(),
      'msg': message.toString(),
      "createAt": DateTime.now().toString()
    };

   await _db.collection('messages').add(msg).then((value) {
      log('message added successfully');
    }).catchError((e) {
      log(e.toString());
    });
  }

  ChatScreenController();
}
