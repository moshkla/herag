import 'package:api_request/api_request.dart';

import '../../../core/models/units_models/unit_model.dart';

class GetSingleUnitAction extends ApiRequestAction<UnitModel> {
  late int unitId;

  GetSingleUnitAction({required this.unitId});

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'projects/units/$unitId';

  @override
  ResponseBuilder<UnitModel> get responseBuilder =>
      (json) => UnitModel.fromJson(json);
}

