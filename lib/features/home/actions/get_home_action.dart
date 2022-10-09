import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';

class HomeAction extends ApiRequestAction<BaseResponseModel> {
  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'home';

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);
}
