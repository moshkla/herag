import 'package:api_request/api_request.dart';
import 'package:majdia/core/models/rental_request_models/show_rental_model.dart';


class ShowRentalRequestAction extends ApiRequestAction<ShowRentalModel> {

  final rentalId;
  ShowRentalRequestAction( {required this.rentalId});


  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;


  @override
  String get path => 'rental-request/show/$rentalId';

  @override
  ResponseBuilder<ShowRentalModel> get responseBuilder =>
          (json) => ShowRentalModel.fromJson(json);

}

