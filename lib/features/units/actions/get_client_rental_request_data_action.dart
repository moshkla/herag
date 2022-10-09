import 'package:api_request/api_request.dart';
import '../../../core/models/rental_request_models/client_rental_request_data_model.dart';

class GetClintRentalDataAction extends ApiRequestAction<ClientRentalRequestDataModel> {

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'create-client-rental-request-data';

  @override
  ResponseBuilder<ClientRentalRequestDataModel> get responseBuilder =>
      (json) => ClientRentalRequestDataModel.fromJson(json);
}

