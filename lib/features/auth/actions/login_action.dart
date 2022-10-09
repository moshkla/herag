

import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';

class LoginAction extends ApiRequestAction<LoginResponse> {
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
  ResponseBuilder<LoginResponse> get responseBuilder =>
          (json) => LoginResponse.fromJson(json);
}

class LoginResponse with BaseResponse{
  String? accessToken;
  LoginResponse.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    accessToken = json["access_token"];
    print("access token is : ${json["access_token"]}");
  }
}