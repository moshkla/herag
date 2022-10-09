import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';
import '../../../core/models/account_models/user_model.dart';

class GetProfileAction extends ApiRequestAction<AuthResponse> {
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'profile';

  @override
  ResponseBuilder<AuthResponse> get responseBuilder =>
      (json) => AuthResponse.fromJson(json);
}
class AuthResponse with BaseResponse{
  UserModel? userModel;

  AuthResponse.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    userModel = UserModel.fromJson(json);
  }
}
