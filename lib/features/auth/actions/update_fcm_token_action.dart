

import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';

class UpdateFCMTokenAction extends ApiRequestAction<BaseResponseModel> {
  late String? fcmToken;

  UpdateFCMTokenAction(
      {
        required this.fcmToken,
      });

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "fcm/update-token";

  @override
  Map<String, dynamic> get toMap => {
    "token": fcmToken,
  };

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
          (json) => BaseResponseModel.fromJson(json);
}
