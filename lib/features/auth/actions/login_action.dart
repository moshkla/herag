

import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';
import '../../../core/models/user_model.dart';

class LoginAction extends ApiRequestAction<UserModel> {
  late String? email;
  late String? password;

  LoginAction(
      {
        required this.email,
        required this.password,
      });

  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "login";

  @override
  Map<String, dynamic> get toMap => {
    "email": email,
    "password": password,
  };

  @override
  ResponseBuilder<UserModel> get responseBuilder =>
          (json) => UserModel.fromJson(json);
}
