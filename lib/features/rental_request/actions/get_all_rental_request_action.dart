import 'package:api_request/api_request.dart';

import '../../../core/models/rental_request_models/rental_requests_list_model.dart';

class GetAllRentalRequestsAction extends ApiRequestAction<RentalRequestsListModel> {
  final unitId;

  GetAllRentalRequestsAction({required this.unitId});
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "rental-request/list/$unitId";

  @override
  ResponseBuilder<RentalRequestsListModel> get responseBuilder =>
      (json) => RentalRequestsListModel.fromJson(json);
}

