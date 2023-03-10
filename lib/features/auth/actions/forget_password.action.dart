import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';

class ForgetPasswordAction extends ApiRequestAction<BaseResponseModel> {
  late String? phone;

  ForgetPasswordAction({
    required this.phone,
  });

  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "forget-password";

  @override
  Map<String, dynamic> get toMap => {
        "phone": phone,
      };

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);
}
