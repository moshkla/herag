import 'package:herag/core/models/posts_model.dart';

class AdDetailsModel {
  int? code;
  bool? status;
  String? message;
  Body? body;
  String? info;

  AdDetailsModel(
      {this.code,
        this.status,
        this.message,
        this.body,
        this.info});

  AdDetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    info = json['info'];
  }

}


class Post {
  int? id;
  List<String>? image;
  String? title;
  String? description;
  String? showNumber;
  String? phone;
  String? area;
  String? user;
  String? price;
  String? time;
  bool? inFavourites;

  Post(
      {this.id,
        this.image,
        this.title,
        this.description,
        this.showNumber,
        this.phone,
        this.area,
        this.user,
        this.price,
        this.time,
        this.inFavourites});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'].cast<String>();
    title = json['title'];
    description = json['description'];
    showNumber = json['show_number'];
    phone = json['phone'];
    area = json['area'];
    user = json['user'];
    price = json['price'];
    time = json['time'];
    inFavourites = json['in_favourites'];
  }

}

class Body {
  Post? post;
  List<String>? comments;
  List<Posts>? similar;

  Body({this.post, this.comments, this.similar});

  Body.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
    if (json['comments'] != null) {
      comments = <String>[];
      json['comments'].forEach((v) {
        comments!.add(v);
      });
    }
    if (json['similar'] != null) {
      similar = <Posts>[];
      json['similar'].forEach((v) {
        similar!.add(new Posts.fromJson(v));
      });
    }
  }

}




