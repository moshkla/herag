class HomeModel {
  int? code;
  bool? status;
  String? message;
  Body? body;
  String? info;

  HomeModel(
      {this.code,
      this.status,
      this.message,
      this.body,
      this.info});

  HomeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    info = json['info'];
  }
}

class Body {
  List<Sliders>? sliders;
  List<Categories>? categories;

  Body({this.sliders, this.categories});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(new Sliders.fromJson(v));
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

class Sliders {
  int? id;
  String? title;
  String? description;
  String? image;

  Sliders({this.id, this.title, this.description, this.image});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
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
