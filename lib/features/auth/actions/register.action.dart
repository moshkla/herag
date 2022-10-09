import 'package:api_request/api_request.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'login_action.dart';

class RegisterAction extends ApiRequestAction<LoginResponse> {
  late String name;
  late String email;
  late String phone;
  late String password;
  late String passwordConfirmation;
  late String nationalId;
  late DateTime dateOfBirth;
  late String gender;
  late String cityId;
  late String countryId;

  RegisterAction({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.nationalId,
    required this.dateOfBirth,
    required this.gender,
    required this.cityId,
    required this.countryId,
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
        'password_confirmation': passwordConfirmation,
        'national_id': nationalId,
        'date_of_birth': f.format(dateOfBirth),
        'gender': gender,
        'city_id': cityId,
        'nationality_id': countryId,
      };

  @override
  ResponseBuilder<LoginResponse> get responseBuilder =>
      (json) => LoginResponse.fromJson(json);
}
