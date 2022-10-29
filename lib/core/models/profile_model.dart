class ProfileModel {
  String? code;
  bool? status;
  String? message;
  Body? body;
  String? info;

  ProfileModel({this.code, this.status, this.message, this.body, this.info});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    info = json['info'];
  }
}

class Body {
  User? user;
  List<UserPosts>? userPosts;

  Body({this.user, this.userPosts});

  Body.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['user_posts'] != null) {
      userPosts = <UserPosts>[];
      json['user_posts'].forEach((v) {
        userPosts!.add(new UserPosts.fromJson(v));
      });
    }
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
    name = json['name']??'';
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    createdAt = json['created_at'];
  }
}

class UserPosts {
  int? id;
  List<String>? image;
  String? title;
  String? area;
  String? user;
  String? category;
  String? price;
  String? time;
  bool? inFavourites;

  UserPosts(
      {this.id,
      this.image,
      this.title,
      this.area,
      this.user,
      this.category,
      this.price,
      this.time,
      this.inFavourites});

  UserPosts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'].cast<String>();
    title = json['title'];
    area = json['area'];
    user = json['user'];
    category = json['category'];
    price = json['price'];
    time = json['time'];
    inFavourites = json['in_favourites'];
  }

}
