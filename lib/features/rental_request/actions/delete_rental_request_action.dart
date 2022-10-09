import 'package:api_request/api_request.dart';
import 'package:majdia/core/base_response.dart';


class DeleteRentalRequestAction extends ApiRequestAction<BaseResponseModel> {

  final rentalId;
  DeleteRentalRequestAction( {required this.rentalId});


  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;


  @override
  String get path => 'rental-request/delete/$rentalId';

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);

}

