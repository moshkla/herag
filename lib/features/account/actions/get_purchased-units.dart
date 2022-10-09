import 'package:api_request/api_request.dart';
import 'package:majdia/core/models/units_models/purchased_units_model.dart';


class GetPurchasedUnitsAction extends ApiRequestAction<PurchasedUnitsModel> {
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "purchased-units";

  @override
  ResponseBuilder<PurchasedUnitsModel> get responseBuilder =>
      (json) => PurchasedUnitsModel.fromJson(json);
}
