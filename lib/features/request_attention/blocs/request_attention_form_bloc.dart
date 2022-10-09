import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:majdia/features/account/blocs/account.controller.dart';
import '../../../core/base_response.dart';
import '../../../core/models/attention_request_models/attention_request_model.dart';
import '../../../core/models/attention_request_models/post_attention_model.dart';
import '../../../core/models/name_with_int_id_model.dart';
import '../../../core/models/projects_models/fliter_model.dart';
import '../../../core/models/name_with_string_id_model.dart';
import '../../../utils/notification_utils.dart';
import '../../../utils/validator.utils.dart';
import '../actions/post_attention_request_action.dart';

class RequestAttentionFormBloc extends FormBloc<BaseResponseModel, String> {
  AttentionRequestModel? attentionRequestModel;

  String? hasKitchen;
  String? hasToiletElderly;
  TextFieldBloc name =
      TextFieldBloc(name: "name", validators: [ValidatorUtils.name]);
  TextFieldBloc notes = TextFieldBloc(name: "notes");

  final country = SelectFieldBloc<NameWithIntId, dynamic>(
      name: "country",
      items: Get.find<AccountController>()
          .attentionRequestModel!
          .data!
          .nationalities!);
  final area = SelectFieldBloc<Areas, dynamic>(
      name: "area",
      items: Get.find<AccountController>().attentionRequestModel!.data!.areas!);
  final city = SelectFieldBloc<Cities, dynamic>(name: "city", items: []);
  final distinct =
      SelectFieldBloc<Districts, dynamic>(name: "distinct", items: []);

  final paymentType = SelectFieldBloc<NameWithStringId, dynamic>(
      name: "payment_type",
      items: Get.find<AccountController>()
          .attentionRequestModel!
          .data!
          .paymentMethod!);
  final reasonForPurchase = SelectFieldBloc<NameWithStringId, dynamic>(
      name: "reason_for_purchase",
      items: Get.find<AccountController>()
          .attentionRequestModel!
          .data!
          .reasonForBuy!);
  final unitPriceRange = SelectFieldBloc<NameWithStringId, dynamic>(
      name: "unit_price_range",
      items: Get.find<AccountController>()
          .attentionRequestModel!
          .data!
          .unitPriceRange!);
  final unitSizeRange = SelectFieldBloc<NameWithStringId, dynamic>(
      name: "unit_size_range",
      items: Get.find<AccountController>()
          .attentionRequestModel!
          .data!
          .unitSizeRange!);
  final howHearAboutUs = SelectFieldBloc<NameWithStringId, dynamic>(
      name: "how_hear_about_us",
      items: Get.find<AccountController>()
          .attentionRequestModel!
          .data!
          .howHearAboutUs!);
  final bedroomCount = SelectFieldBloc<NameWithIntId, dynamic>(
      name: "bedroom_count",
      items: Get.find<AccountController>()
          .attentionRequestModel!
          .data!
          .bedroomCount!);
  final additional = MultiSelectFieldBloc<String, dynamic>(
    items: [
      'toilet'.tr,
      'kitchen'.tr,
    ],
  );
  TextFieldBloc email =
      TextFieldBloc(name: "email", validators: [ValidatorUtils.email]);
  TextFieldBloc phone =
      TextFieldBloc(name: "phone", validators: [ValidatorUtils.phone]);

  TextFieldBloc national_id = TextFieldBloc(
      name: "national_id", validators: [ValidatorUtils.nationalId]);

  final interestedProjects = MultiSelectFieldBloc<AttentionProject, dynamic>(
      name: 'interestedProjects',
      items:
          Get.find<AccountController>().attentionRequestModel!.data!.projects!);

  RequestAttentionFormBloc() : super(isLoading: true) {
    addFieldBlocs(fieldBlocs: [
      name,
      email,
      phone,
      city,
      area,
      country,
      distinct,
      reasonForPurchase,
      unitPriceRange,
      unitSizeRange,
      bedroomCount,
      interestedProjects,
      national_id,
      paymentType,
      additional,
      notes,
      howHearAboutUs
    ]);
    area.onValueChanges(onData: (c, n) async* {
      city.updateItems(area.value!.cities!);
      if (areasSelected.contains(n.value!.id.toString())) {
        areasSelected.remove(n.value!.id.toString());
        areasObject.remove(n.value!);
      } else {
        areasObject.add(n.value!);
        areasSelected.add(n.value!.id.toString());
      }
    });
    city.onValueChanges(onData: (c, n) async* {
      distinct.updateItems(city.value!.districts!);
      if (citiesSelected.contains(n.value!.id.toString())) {
        citiesSelected.remove(n.value!.id.toString());
        areasObject.remove(n.value!);
      } else {
        cityObject.add(n.value!);
        citiesSelected.add(n.value!.id.toString());
      }
    });
    distinct.onValueChanges(onData: (c, n) async* {
      if (distinctsSelected.contains(n.value!.id.toString())) {
        distinctsSelected.remove(n.value!.id.toString());
        distinctObject.remove(n.value!);
      } else {
        distinctObject.add(n.value!);
        distinctsSelected.add(n.value!.id.toString());
      }
    });
  }

  @override
  void onLoading() async {
    attentionRequestModel = Get.find<AccountController>().attentionRequestModel;
  }

  late PostAttentionModel model;

  List<String> projectSelected = [];
  List<Areas> areasObject = [];
  List<Cities> cityObject = [];
  List<Districts> distinctObject = [];
  List<String> areasSelected = [];

  List<String> citiesSelected = [];
  List<String> distinctsSelected = [];
  List<String> blocksSelected = [];
  Map<String, dynamic>? client;

  @override
  void onSubmitting() async {
    client = {
      'id': null,
      'name': name.value,
      'phone': phone.value,
      'email': email.value,
      'national_id': national_id.value,
      'nationality_id': country != null ? country.value!.id : null,
    };

    model = PostAttentionModel(
      hasToiletElderly: hasToiletElderly ?? '0',
      bedroomCount:
      bedroomCount != null ? bedroomCount.value!.id!.toString() : '',
      paymentMethod: paymentType != null ? paymentType.value!.id! : '',
      howHearAboutUs:
      howHearAboutUs != null ? howHearAboutUs.value!.id! : '',
      cityIds: citiesSelected,
      districtIds: distinctsSelected,
      projectSizeRange: null,
      blockIds: blocksSelected,
      unitSizeRange:
      unitSizeRange != null ? unitSizeRange.value!.id! : '',
      unitIds: [],
      reasonForBuy:
      reasonForPurchase != null ? reasonForPurchase.value!.id! : '',
      hasKitchen: hasKitchen ?? '0',
      projectIds: projectSelected,
      notes: notes != null ? notes.value : null,
      unitPriceRange:
      unitPriceRange != null ? unitPriceRange.value!.id! : '',
      projectSpecifications: ['project_specifications'],
    );

    PostAttentionRequestAction postAttentionRequestAction =
        PostAttentionRequestAction(model: model, client: client!);
    postAttentionRequestAction.onQueue();

    postAttentionRequestAction.onError = (e) {
      print(e.message);
      emitFailure(failureResponse: e.message);
      NotificationUtils.showErrorSnackBar(e.message!);
    };
    postAttentionRequestAction.onSuccess = (res) {
      if (res!.status == 1) {
        emitSuccess(canSubmitAgain: true, successResponse: res);
        NotificationUtils.showSuccessSnackBar(res.message ?? '');
        Get.back();
      } else {
        emitFailure(failureResponse: res.message ?? "");
        NotificationUtils.showErrorSnackBar(res.message ?? "");
      }
    };
  }
}
