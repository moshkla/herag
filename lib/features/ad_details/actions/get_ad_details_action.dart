import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';
import 'package:herag/core/models/posts_model.dart';

import '../../../core/models/ad_details_model.dart';

class GetAdDetailsAction extends ApiRequestAction<AdDetailsModel> {
  final int adId;

  GetAdDetailsAction(this.adId);

  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'post/$adId';

  @override
  ResponseBuilder<AdDetailsModel> get responseBuilder =>
      (json) => AdDetailsModel.fromJson(json);
}
