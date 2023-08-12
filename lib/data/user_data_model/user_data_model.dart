class UserDataModel {
  String? photoUrl;
  String? addTime;
  String? name;
  String? id;
  String? fcmToken;
  List<String>? friends;
  String? email;

  UserDataModel(
      {this.photoUrl,
        this.addTime,
        this.name,
        this.id,
        this.fcmToken,
        this.friends,
        this.email});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    photoUrl = json['photoUrl'];
    addTime = json['addTime'];
    name = json['name'];
    id = json['id'];
    fcmToken = json['fcmToken'];
    friends = json['friends'].cast<String>();
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photoUrl'] = photoUrl;
    data['addTime'] = addTime;
    data['name'] = name;
    data['id'] = id;
    data['fcmToken'] = fcmToken;
    data['friends'] = friends;
    data['email'] = email;
    return data;
  }
}
