import 'package:api_request/api_request.dart';
import '../../../core/models/home_models/home_model.dart';

class HomeAction extends ApiRequestAction<HomeModel> {
  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'home';

  @override
  ResponseBuilder<HomeModel> get responseBuilder =>
      (json) => HomeModel.fromJson(json);
}
