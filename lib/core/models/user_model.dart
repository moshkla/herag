class UserModel {
  int? code;
  bool? status;
  String? message;
  Body? body;

  UserModel({
    this.code,
    this.status,
    this.message,
    this.body,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }
}

class Body {
  User? user;
  String? accessToken;

  Body({this.user, this.accessToken});

  Body.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }
}

class User {
  String? name;
  String? email;
  String? image;
  String? phone;
  String? createdAt;

  User({this.name, this.email, this.image, this.phone, this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    createdAt = json['created_at'];
  }
}
