import 'package:get/get.dart';
import 'package:majdia/core/models/projects_models/project_details_model.dart';
import 'package:majdia/core/routes/routes.dart';
import 'package:majdia/features/projects/actions/get_project_details_action.dart';
import 'package:majdia/features/projects/actions/get_projects_action.dart';

import 'package:latlong2/latlong.dart';

import '../../../core/models/projects_models/project_model.dart';

class ProjectsController extends GetxController {
  initProjects() {
    getProjects();
  }

  ProjectModel? projectModel;
  List<Projects> projects = [];
  bool projectLoading = true;
  List<LatLng> dots = [];

  getProjects({String? status, int? cityId, int? districtId}) async {
    ProjectResponse? projectResponse = await GetProjectsAction(
            status: status, cityId: cityId, districtId: districtId)
        .execute();
    projectModel = projectResponse!.projectModel;
    for (var element in projectModel!.projects!) {
      projects.add(element);
    }
    projectLoading = false;
    dots.clear();
    for (var element in projectModel!.projects!) {
      if (element.location!.latitude != null) {
        dots.add(LatLng(double.parse(element.location!.latitude!.toString()),
            double.parse(element.location!.longitude!.toString())));
      }
    }
    update();
  }

  ProjectDetailsModel? projectDetailsModel;

  getProjectDetails({required int projectId}) async {
    projectLoading = true;
    projectDetailsModel =
        await GetProjectDetailsAction(projectId: projectId).execute();

    update();
    projectLoading = false;
  }

  goProjectDetailsScreen({required int projectId}) {
    getProjectDetails(projectId: projectId);
    Get.toNamed(Routes.projectDetails);
  }
}
