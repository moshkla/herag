import 'package:api_request/api_request.dart';

import 'change_password.action.dart';

class ChangePasswordAuthenticatedAction extends ApiRequestAction<ChangePasswordResponse> {
  late String? password;
  late String? confirmPassword;

  ChangePasswordAuthenticatedAction(
      {
        required this.password,
        required this.confirmPassword,
      });

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "change-password";

  @override
  Map<String, dynamic> get toMap => {
    "password": password,
    "password_confirmation": confirmPassword,
  };

  @override
  ResponseBuilder<ChangePasswordResponse> get responseBuilder =>
          (json) => ChangePasswordResponse.fromJson(json);
}

