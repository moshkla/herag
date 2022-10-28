class FaqsModel {
  String? code;
  bool? status;
  String? message;
  Body? body;
  String? info;

  FaqsModel(
      {this.code,
        this.status,
        this.message,
        this.body,
        this.info});

  FaqsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    info = json['info'];
  }

}

class Body {
  List<Questions>? questions;

  Body({this.questions});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }
}

class Questions {
  int? id;
  String? question;
  String? answer;

  Questions({this.id, this.question, this.answer});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

}

