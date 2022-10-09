import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';

class ForgetPasswordAction extends ApiRequestAction<ForgetPasswordResponse> {
  late String? email;

  ForgetPasswordAction(
      {
        required this.email,
      });

  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "request-reset-password";

  @override
  Map<String, dynamic> get toMap => {
    "email": email,
  };

  @override
  ResponseBuilder<ForgetPasswordResponse> get responseBuilder =>
          (json) => ForgetPasswordResponse.fromJson(json);
}

class ForgetPasswordResponse with BaseResponse{

  ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
  }
}