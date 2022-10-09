import 'package:api_request/api_request.dart';
import 'package:majdia/core/models/projects_models/project_details_model.dart';

class GetProjectDetailsAction extends ApiRequestAction<ProjectDetailsModel> {
  int projectId;

  GetProjectDetailsAction({required this.projectId});

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'projects/$projectId';

  @override
  ResponseBuilder<ProjectDetailsModel> get responseBuilder =>
      (json) => ProjectDetailsModel.fromJson(json);
}

