import 'package:api_request/api_request.dart';
import 'package:majdia/core/models/account_models/terms_and_condition_model.dart';


class GetTermsAndCondtionsAction
    extends ApiRequestAction<TermsAndCondtionModel> {
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "terms-and-conditions";

  @override
  ResponseBuilder<TermsAndCondtionModel> get responseBuilder =>
      (json) => TermsAndCondtionModel.fromJson(json);
}
