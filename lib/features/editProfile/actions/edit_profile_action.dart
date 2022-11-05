import 'dart:math';

import 'package:api_request/api_request.dart';
import 'package:get_it/get_it.dart';

import '../../../business logic/appCubit/appcubit_cubit.dart';
import '../../../core/utiles/local_storage.utils.dart';
import 'get_profile_action.dart';
import 'package:dio/dio.dart';

class EditProfileAction extends ApiRequestAction<AuthResponse> {
final String name;
final String email;
final String phone;
final MapEntry image;

  EditProfileAction({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "edit/profile";

  @override
  ContentDataType get contentDataType => ContentDataType.formData;
  Map<String, dynamic>? pickedImage = {
    'image':MultipartFile.fromFile( GetIt.I<AppCubit>().pickedImage?.path ?? '')
  };
  @override
  Map<String, dynamic> get toMap =>
      {'name': name, 'email': email, 'phone': phone,
       'image': pickedImage
      };

  @override
  ResponseBuilder<AuthResponse> get responseBuilder =>
      (json) => AuthResponse.fromJson(json);
}


