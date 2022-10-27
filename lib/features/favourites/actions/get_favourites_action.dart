import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';
import 'package:herag/core/models/posts_model.dart';

class GetFavouritesAction extends ApiRequestAction<PostsModel> {

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'user/favourites';


  @override
  ResponseBuilder<PostsModel> get responseBuilder =>
      (json) => PostsModel.fromJson(json);
}
