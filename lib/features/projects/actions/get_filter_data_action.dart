import 'package:api_request/api_request.dart';
import 'package:majdia/core/models/projects_models/fliter_model.dart';

class GetFilterDataAction extends ApiRequestAction<FilterDataResponse> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'projects-filter-data';

  @override
  ResponseBuilder<FilterDataResponse> get responseBuilder =>
      (json) => FilterDataResponse.fromJson(json);
}

class FilterDataResponse {
  FilterDataModel? filterDataModel;

  FilterDataResponse.fromJson(Map<String, dynamic> json) {
    try {
      filterDataModel = FilterDataModel.fromJson(json);
    } catch (e) {
      print(e.toString());
    }
    print('status is : ${filterDataModel!.data!.statuses!.sold!.ar}');
  }
}
