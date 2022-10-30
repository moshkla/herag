import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';
import 'package:herag/core/models/posts_model.dart';

class ContactUsAction extends ApiRequestAction<BaseResponseModel> {
  final String name;
  final String email;
  final String phone;
  final String message;

  ContactUsAction(this.name, this.email, this.phone, this.message);

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => 'home/contact';

  @override
  Map<String, dynamic> get toMap =>
      {'email': email, 'message': message, 'phone': phone, 'name': name};

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);
}
