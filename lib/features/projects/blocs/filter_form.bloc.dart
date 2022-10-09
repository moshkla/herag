import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:majdia/features/projects/blocs/projects.controller.dart';
import 'package:majdia/utils/local_storage.utils.dart';
import '../../../core/models/lang_model.dart';
import '../../../core/models/projects_models/fliter_model.dart';
import '../actions/get_filter_data_action.dart';

class ProjectsFilterFormBloc extends FormBloc {
  final city = SelectFieldBloc<Areas, dynamic>(name: "city");
  final area = SelectFieldBloc<Cities, dynamic>(name: "area");
  final projectStatus = SelectFieldBloc<String, dynamic>(name: "area");

  ProjectsFilterFormBloc() : super(isLoading: true) {
    addFieldBlocs(fieldBlocs: [area, city, projectStatus]);
    city.onValueChanges(onData: (c, n) async* {
      area.updateItems(city.value!.cities!);
    });
  }

  FilterDataModel? filterDataModel;
  List<String> citiesNames = [];
  List<String>? districtsNames = [];
  final List<Lang> statusNames = [];
  final List<String> ar = [];
  final List<String> en = [];

  @override
  void onLoading() async {
    FilterDataResponse? filterDataResponse =
        await GetFilterDataAction().execute();
    filterDataModel = filterDataResponse!.filterDataModel;
    city.updateItems(filterDataModel!.data!.areas!);
    statusNames.add(filterDataModel!.data!.statuses!.sold!);
    statusNames.add(filterDataModel!.data!.statuses!.soonForSale!);
    // statusNames.add(filterDataModel!.data!.statuses!.underConstruction!);
    statusNames.add(filterDataModel!.data!.statuses!.underSale!);

    for (var element in statusNames) {
      ar.add(element.ar!);
      en.add(element.en!);
    }
    projectStatus.updateItems(LocalStorageUtils.locale == 'ar' ? ar : en);

    emitLoaded();
  }

  @override
  onSubmitting() {
    int? cityKey;
    Lang? statusKey;
    for (var element in filterDataModel!.data!.areas!) {
      if (element.name == city.value) {
        cityKey = element.id;
      }
    }

    for (var element in statusNames) {
      if (LocalStorageUtils.locale == 'ar') {
        if (element.ar == projectStatus.value) {
          statusKey = element;
        }
      } else {
        if (element.en == projectStatus.value) {
          statusKey = element;
        }
      }
    }
    String? statusChoosen;
    switch (statusKey!.en) {
      case 'under construction':
        statusChoosen = "under_construction";
        break;
      case 'soon for sale':
        statusChoosen = "soon_for_sale";
        break;
      case 'under sale':
        statusChoosen = "under_sale";
        break;
      case 'sold':
        statusChoosen = "sold";
        break;
    }

    Get.find<ProjectsController>().getProjects(
      status: statusChoosen,
      cityId: cityKey,
    );
    Get.back();
  }
}
