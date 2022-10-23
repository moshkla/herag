import 'package:api_request/api_request.dart';

import '../../../core/base_response.dart';

class UpdatePasswordAction extends ApiRequestAction<BaseResponseModel> {
  late String? phone;
  late String? newPassword;
  late String? newPasswordConfirmation;

  UpdatePasswordAction({
    required this.phone,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });

  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "change-password-outside";

  @override
  Map<String, dynamic> get toMap => {
        'phone': phone,
        'newPassword': newPassword,
        'newPasswordConfirmation': newPasswordConfirmation
      };

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);
}
