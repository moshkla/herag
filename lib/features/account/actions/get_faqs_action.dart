import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';
import '../../../core/models/constants_model.dart';
import '../../../core/models/faqsModel.dart';

class GetFaqsAction extends ApiRequestAction<FaqsModel> {
  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "faqs";

  @override
  ResponseBuilder<FaqsModel> get responseBuilder =>
      (json) => FaqsModel.fromJson(json);
}
