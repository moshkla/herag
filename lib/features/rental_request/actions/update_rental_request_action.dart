import 'package:api_request/api_request.dart';
import 'package:majdia/core/base_response.dart';

import '../../../core/models/rental_request_models/post_rental_data_model.dart';

class UpdateRentalRequestAction extends ApiRequestAction<BaseResponseModel> {

  final rentalId;
  final PostRentalDataModel model;

  UpdateRentalRequestAction( {required this.rentalId,required this.model});


  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;


  @override
  String get path => 'rental-request/update/$rentalId';

  @override
  Map<String, dynamic> get toMap => model.toMap();

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);

}

