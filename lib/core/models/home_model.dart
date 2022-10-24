class HomeModel {
  int? code;
  bool? status;
  String? message;
  Body? body;

  HomeModel({this.code, this.status, this.message, this.body});

  HomeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }
}

class Body {
  List<String>? sliders;
  List<Categories>? categories;

  Body({this.sliders, this.categories});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <String>[];
      json['sliders'].forEach((v) {
        sliders!.add(v);
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }
}

class Categories {
  int? id;
  String? title;
  List<Children>? children;
  String? image;

  Categories({this.id, this.title, this.children, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    image = json['image'];
  }
}

class Children {
  int? id;
  String? title;
  List<Children>? children;
  String? image;

  Children({this.id, this.title, this.children, this.image});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    image = json['image'];
  }
}
