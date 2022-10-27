import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';

class ToggelFavouriteAction extends ApiRequestAction<BaseResponseModel> {
  final int postId;

  ToggelFavouriteAction({required this.postId});

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => 'user/add_to_fav';

  @override
  Map<String, dynamic> get toMap => {
        'post_id': postId,
      };

  @override
  ResponseBuilder<BaseResponseModel> get responseBuilder =>
      (json) => BaseResponseModel.fromJson(json);
}
