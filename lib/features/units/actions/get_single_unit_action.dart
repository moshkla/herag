import 'package:api_request/api_request.dart';

import '../../../core/models/units_models/unit_model.dart';

class GetSingleUnitAction extends ApiRequestAction<UnitResponse> {
  late int unitId;

  GetSingleUnitAction({required this.unitId});

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'projects/units/$unitId';

  @override
  ResponseBuilder<UnitResponse> get responseBuilder =>
      (json) => UnitResponse.fromJson(json);
}

class UnitResponse {
  UnitModel? unitModel;

  UnitResponse.fromJson(Map<String, dynamic> json) {
    try {
      if (json["unit"] != null) {
        unitModel = UnitModel.fromJson(json);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
