import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';
import 'package:herag/core/models/posts_model.dart';

class GetAreasAction extends ApiRequestAction<BaseResponseModel> {
  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'api/area';

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);
}
