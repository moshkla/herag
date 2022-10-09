import 'package:api_request/api_request.dart';

import '../../../core/models/rental_request_models/rental_data_model.dart';

class GetRentalDataAction extends ApiRequestAction<RentalRequestResponse> {
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "create-rental-request-data";

  @override
  ResponseBuilder<RentalRequestResponse> get responseBuilder =>
      (json) => RentalRequestResponse.fromJson(json);
}

class RentalRequestResponse {
  RentalDataModel? rentalDataModel;

  RentalRequestResponse.fromJson(Map<String, dynamic> json) {
    rentalDataModel = RentalDataModel.fromJson(json);
  }
}
