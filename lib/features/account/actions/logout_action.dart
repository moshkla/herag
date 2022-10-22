import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';

class LogOutAction extends ApiRequestAction<BaseResponseModel> {
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "logout";

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);
}
