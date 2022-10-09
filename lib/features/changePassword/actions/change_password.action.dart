import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';

class ChangePasswordAction extends ApiRequestAction<ChangePasswordResponse> {
  late String? email;
  late String? password;
  late String? confirmPassword;
  late String? code;

  ChangePasswordAction(
      {
        required this.email,
        required this.password,
        required this.confirmPassword,
        required this.code,
      });

  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "reset-password";

  @override
  Map<String, dynamic> get toMap => {
    "email": email,
    "password": password,
    "password_confirmation": confirmPassword,
    "code": code,
  };

  @override
  ResponseBuilder<ChangePasswordResponse> get responseBuilder =>
          (json) => ChangePasswordResponse.fromJson(json);
}

class ChangePasswordResponse with BaseResponse{

  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    print("change password response is : $json");
  }
}