

import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';

class DeleteAccountAction extends ApiRequestAction<BaseResponseModel> {

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "delete_acc";


  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
          (json) => BaseResponseModel.fromJson(json);
}