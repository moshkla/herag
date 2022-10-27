import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';
import '../../../core/models/constants_model.dart';

class GetConstantsAction extends ApiRequestAction<ConstantsModel> {
  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "page";

  @override
  ResponseBuilder<ConstantsModel> get responseBuilder =>
      (json) => ConstantsModel.fromJson(json);
}
