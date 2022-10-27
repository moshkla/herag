import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';
import 'package:herag/core/models/posts_model.dart';

class GetPostsAction extends ApiRequestAction<PostsModel> {
  final int categoryId;

  GetPostsAction(this.categoryId);

  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'home/filter';

  @override
  Map<String, dynamic> get toMap => {'category_id': categoryId};

  @override
  ResponseBuilder<PostsModel> get responseBuilder =>
      (json) => PostsModel.fromJson(json);
}
