class ConstantsModel {
  int? code;
  bool? status;
  String? message;
  Body? body;

  String? info;

  ConstantsModel(
      {this.code,
        this.status,
        this.message,
        this.body,
        this.info});

  ConstantsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    info = json['info'];
  }

}



class Body {
  Lang? about;
  Lang? terms;
  Lang? privacy;
  Lang? qasam;

  Body({this.about, this.terms, this.privacy, this.qasam});

  Body.fromJson(Map<String, dynamic> json) {
    about = json['about'] != null ? new Lang.fromJson(json['about']) : null;
    terms = json['terms'] != null ? new Lang.fromJson(json['terms']) : null;
    privacy =
    json['privacy'] != null ? new Lang.fromJson(json['privacy']) : null;
    qasam = json['qasam'] != null ? new Lang.fromJson(json['qasam']) : null;
  }

}

class Lang {
  String? ar;
  String? en;

  Lang({this.ar, this.en});

  Lang.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}

