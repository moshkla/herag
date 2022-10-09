import 'package:api_request/api_request.dart';
import '../../../core/models/register_data_model.dart';

class GetRegisterDataAction extends ApiRequestAction<RegisterDataResponse> {
  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "register-data";

  @override
  ResponseBuilder<RegisterDataResponse> get responseBuilder =>
      (json) => RegisterDataResponse.fromJson(json);
}

class RegisterDataResponse {
  RegisterDataModel? FilterDataModel;

  RegisterDataResponse.fromJson(Map<String, dynamic> json) {
    FilterDataModel = RegisterDataModel.fromJson(json);
  }
}
