class PostsModel {
  int? code;
  bool? status;
  String? message;
  Body? body;
  String? info;

  PostsModel(
      {this.code,
        this.status,
        this.message,
        this.body,
        this.info});

  PostsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    info = json['info'];
  }

}

class Body {
  int? postsCount;
  List<Posts>? posts;

  Body({this.postsCount, this.posts});

  Body.fromJson(Map<String, dynamic> json) {
    postsCount = json['posts_count'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

}

class Posts {
  int? id;
  List<String>? image;
  String? title;
  String? area;
  String? user;
  String? category;
  String? price;
  String? time;
  bool? inFavourites;

  Posts(
      {this.id,
        this.image,
        this.title,
        this.area,
        this.user,
        this.category,
        this.price,
        this.time,
        this.inFavourites});

  Posts.fromJson(Map<String, dynamic> json) {
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