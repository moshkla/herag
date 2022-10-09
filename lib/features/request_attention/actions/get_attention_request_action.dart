import 'package:api_request/api_request.dart';

import '../../../core/models/attention_request_models/attention_request_model.dart';

class GetRequestAttentionAction
    extends ApiRequestAction<AttentionRequestModel> {
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "create-attention-request-data";

  @override
  ResponseBuilder<AttentionRequestModel> get responseBuilder =>
      (json) => AttentionRequestModel.fromJson(json);
}
