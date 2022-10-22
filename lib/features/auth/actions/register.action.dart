import 'package:api_request/api_request.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../core/models/user_model.dart';

class RegisterAction extends ApiRequestAction<UserModel> {
  late String name;
  late String email;
  late String phone;
  late String password;

  RegisterAction({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "register";

  final f = DateFormat('yyyy-MM-dd');

  @override
  @override
  Map<String, dynamic> get toMap => {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      };

  @override
  ResponseBuilder<UserModel> get responseBuilder =>
      (json) => UserModel.fromJson(json);
}
