class Friends {
  String? photoUrl;
  String? name;
  String? location;
  String? id;
  String? email;

  Friends({this.photoUrl, this.name, this.location, this.id, this.email});

  Friends.fromJson(Map<String, dynamic> json) {
    photoUrl = json['photoUrl'];
    name = json['name'];
    location = json['location'];
    id = json['id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photoUrl'] = photoUrl;
    data['name'] = name;
    data['location'] = location;
    data['id'] = id;
    data['email'] = email;
    return data;
  }
}