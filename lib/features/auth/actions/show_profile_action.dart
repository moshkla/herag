import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';
import '../../../core/models/profile_model.dart';

class ShowProfileAction extends ApiRequestAction<ProfileModel> {
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "user/profile";

  @override
  ResponseBuilder<ProfileModel> get responseBuilder =>
      (json) => ProfileModel.fromJson(json);
}
