import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';


class GetTermsAndCondtionsAction
    extends ApiRequestAction<BaseResponseModel> {
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "terms-and-conditions";

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);
}
