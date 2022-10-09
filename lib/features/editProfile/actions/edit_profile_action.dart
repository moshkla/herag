import 'package:api_request/api_request.dart';

import 'get_profile_action.dart';

class EditProfileAction extends ApiRequestAction<AuthResponse> {
  late String name;
  late String email;
  late String phone;
  late String nationalId;
  late DateTime dateOfBirth;
  late String gender;
  late String cityId;
  late String countryId;

  EditProfileAction({
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.dateOfBirth,
    required this.gender,
    required this.cityId,
    required this.countryId,
  });

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "update-profile";

  // final f = DateFormat('yyyy-MM-dd');

  @override
  Map<String, dynamic> get toMap => {
    'name': name,
    'email': email,
    'phone': phone,
    'national_id': nationalId,
    // 'date_of_birth': f.format(dateOfBirth),
    'gender': gender,
    'city_id': cityId,
    'nationality_id': countryId,
      };

  @override
  ResponseBuilder<AuthResponse> get responseBuilder =>
      (json) => AuthResponse.fromJson(json);
}
