import 'package:api_request/api_request.dart';
import 'package:majdia/core/base_response.dart';

import '../../../core/models/rental_request_models/post_rental_data_model.dart';

class PostRentalRequestAction extends ApiRequestAction<BaseResponseModel> {

  final PostRentalDataModel model;

  PostRentalRequestAction({required this.model});


  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;


  @override
  String get path => 'rental-request/store';

  @override
  Map<String, dynamic> get toMap => model.toMap();

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);

}

