import 'package:get/get.dart';
import 'package:majdia/core/models/attention_request_models/attention_request_model.dart';
import 'package:majdia/core/models/units_models/purchased_units_model.dart';
import 'package:majdia/core/models/rental_request_models/rental_requests_list_model.dart';
import 'package:majdia/core/models/rental_request_models/show_rental_model.dart';
import 'package:majdia/core/models/account_models/terms_and_condition_model.dart';
import 'package:majdia/features/account/actions/get_terms.action.dart';
import 'package:majdia/features/rental_request/actions/delete_rental_request_action.dart';
import 'package:majdia/features/rental_request/actions/get_all_rental_request_action.dart';
import 'package:majdia/utils/file.utils.dart';
import '../../../core/models/units_models/unit_model.dart';
import '../../../core/routes/routes.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/notification_utils.dart';
import '../../rental_request/actions/show_rental_request_action.dart';
import '../../request_attention/actions/get_attention_request_action.dart';
import '../actions/delete_account_action.dart';
import '../actions/get_purchased-units.dart';
import '../actions/get_purchased_details.dart';
import '../actions/logout_action.dart';

class AccountController extends GetxController {
  TermsAndCondtionModel? termsAndCondtionModel;
  bool Loading = false;

  getTermsAndConditions() async {
    Loading = true;
    termsAndCondtionModel = await GetTermsAndCondtionsAction().execute();
    Get.toNamed(Routes.terms_and_conditions);
    update();
    Loading = false;
  }

  logOut() async {
    NotificationUtils.showLoadingDialog();
    await LogOutAction().execute().then((value) {
      NotificationUtils.hideLoading();
      Get.offAllNamed(Routes.main);
      LocalStorageUtils.setToken(null);
    });
  }

  deleteAccount() async {
    NotificationUtils.showLoadingDialog();
    await DeleteAccountAction().execute().then((value) {
      NotificationUtils.hideLoading();
      Get.offAllNamed(Routes.main);
      LocalStorageUtils.setToken(null);
    });
  }

  PurchasedUnitsModel? purchasedUnitsModel;

  getMyUnits() async {
    Loading = true;
    NotificationUtils.showLoadingDialog();
    purchasedUnitsModel = await GetPurchasedUnitsAction().execute();
    NotificationUtils.hideLoading();
    Get.toNamed(Routes.my_units);
    update();
    Loading = false;
  }

  AttentionRequestModel? attentionRequestModel;

  getRequestAttentionData() async {
    NotificationUtils.showLoadingDialog();
    await GetRequestAttentionAction().execute().then((value) {
      attentionRequestModel = value;

      NotificationUtils.hideLoading();
      Get.toNamed(Routes.request_attention);
    });
  }

  getMyUnitsDetails({required int unitId}) {
    Get.toNamed(Routes.my_units_details);
    Loading = true;
    try {
      getSinglePurchasedUnit(unitId: unitId);
    } catch (e) {
      print(e.toString());
    }
  }

  UnitModel? unitModel;

  getSinglePurchasedUnit({required int unitId}) async {
    unitModel = await GetSingleUnitAction(unitId: unitId).execute();
    getAllRentalRequests(unitId: unitId);
  }

  RentalRequestsListModel? rentalRequestsListModel;

  getAllRentalRequests({required int unitId}) {
    GetAllRentalRequestsAction getAllRentalRequestsAction =
        GetAllRentalRequestsAction(unitId: unitId);
    getAllRentalRequestsAction.execute();
    getAllRentalRequestsAction.onSuccess = (res) {
      print('asldjfjnlakjdfa s;djfn askjdjfnasdjf nklasjdf najsd');
      rentalRequestsListModel = res;
      Loading = false;
      update();
    };
    getAllRentalRequestsAction.onError = (res) {
      print(res.message);
    };
  }

  downloadFiles({required int contract}) async {
    FileUtils.handleFileClick(
        'https://almajdiah.codelink.com.sa/api/client/v1/files/$contract',
        isPdf: true);
    update();
  }

  bool isUpdating = false;
  ShowRentalModel? showRentalModel;

  showRentalRequest({required int rentalId}) {
    Loading = true;
    isUpdating = true;
    ShowRentalRequestAction showRentalRequestAction =
        ShowRentalRequestAction(rentalId: rentalId);
    showRentalRequestAction.execute();
    showRentalRequestAction.onSuccess = (res) {
      showRentalModel = res;
      Get.toNamed(Routes.rental_request);
      Loading = false;
      update();
    };
  }

  deleteRentalRequest({required rentalId}) {
    DeleteRentalRequestAction deleteRentalRequestAction =
        DeleteRentalRequestAction(rentalId: rentalId);
    deleteRentalRequestAction.execute();
    deleteRentalRequestAction.onSuccess = (res) {
      getAllRentalRequests(unitId: unitModel!.unit!.id!);
      NotificationUtils.showSuccessSnackBar(
          res?.message ?? res?.errors.toString() ?? "");
    };
    deleteRentalRequestAction.onError = (res) {
      NotificationUtils.showSuccessSnackBar(res.errors.toString());
    };
  }
}
