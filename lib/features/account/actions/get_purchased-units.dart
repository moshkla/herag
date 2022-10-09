import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';


class GetPurchasedUnitsAction extends ApiRequestAction<BaseResponseModel> {
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "purchased-units";

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);
}
