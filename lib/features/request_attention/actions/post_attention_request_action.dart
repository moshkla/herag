import 'package:api_request/api_request.dart';
import 'package:majdia/core/base_response.dart';

import '../../../core/models/attention_request_models/post_attention_model.dart';

class PostAttentionRequestAction extends ApiRequestAction<BaseResponseModel> {

 final PostAttentionModel model;
 final Map<String,dynamic> client;
  PostAttentionRequestAction({required this.client,required this.model});


  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.POST;


  @override
  String get path => 'store-attention-request';



  @override
  Map<String, dynamic> get toMap => {
    'id': null,
    'client':client,
    'district_ids[]': model.districtIds,
    'city_ids[]': model.cityIds,
    'block_ids[]': model.blockIds,
    'project_ids[]': model.projectIds,
    'unit_ids[]': model.unitIds,
    'project_specifications[]': model.projectSpecifications,
    'unit_specifications[]': null,
    'unit_price_range': model.unitPriceRange,
    'project_size_range': null,
    'unit_size_range': model.unitSizeRange,
    'bedroom_count': model.bedroomCount,
    'payment_method': model.paymentMethod,
    'reason_for_buy': model.reasonForBuy,
    'how_hear_about_us': model.howHearAboutUs,
    'has_toilet_elderly': model.hasToiletElderly,
    'has_kitchen': model.hasKitchen,
    'note': model.notes
  };
  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);

}

