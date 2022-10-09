import 'package:api_request/api_request.dart';
import '../../../core/models/rental_request_models/client_rental_request_data_model.dart';

class StoreClintRentalAction
    extends ApiRequestAction<ClientRentalRequestDataModel> {
  final int unitId;
  final String batches_type;
  final String? name;
  final String? phone;
  final String? email;
  final String? national_id;

  StoreClintRentalAction({
    required this.unitId,
    required this.batches_type,
    this.name,
    this.phone,
    this.email,
    this.national_id,
  });

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => 'create-client-rental-request';

  @override
  Map<String, dynamic> get toMap => {
        'unit_id': unitId,
        'batches_type': batches_type,
        'name': name,
        'phone': phone,
        'email': email,
        'national_id': national_id
      };

  @override
  ResponseBuilder<ClientRentalRequestDataModel> get responseBuilder =>
      (json) => ClientRentalRequestDataModel.fromJson(json);
}
