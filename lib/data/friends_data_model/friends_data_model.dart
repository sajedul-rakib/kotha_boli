import 'friend.dart';

class FriendsDetailModel {
  List<Friends>? friends;

  FriendsDetailModel({this.friends});

  FriendsDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['friends'] != null) {
      friends = <Friends>[];
      json['friends'].forEach((v) {
        friends!.add(Friends.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (friends != null) {
      data['friends'] = friends!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


