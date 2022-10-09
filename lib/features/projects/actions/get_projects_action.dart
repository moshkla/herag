import 'package:api_request/api_request.dart';

import '../../../core/models/projects_models/project_model.dart';

class GetProjectsAction extends ApiRequestAction<ProjectResponse> {
  String? status;
  int? cityId;
  int? districtId;

  GetProjectsAction({this.status, this.cityId, this.districtId});

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'projects';

  @override
  ResponseBuilder<ProjectResponse> get responseBuilder =>
      (json) => ProjectResponse.fromJson(json);

  @override
  Map<String, dynamic> get toMap => {
        'status': status,
        'city_id': cityId,
        'district_id': districtId,
      };
}

class ProjectResponse {
  ProjectModel? projectModel;

  ProjectResponse.fromJson(Map<String, dynamic> json) {
    if (json["projects"] != null) {
      try {
        projectModel = ProjectModel.fromJson(json);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
