import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';
import 'package:herag/core/models/posts_model.dart';

class SearchAction extends ApiRequestAction<PostsModel> {
  final String title;

  SearchAction(this.title);

  @override
  bool get authRequired => false;

  @override
  RequestMethod get method => RequestMethod.POST;


  @override
  String get path => 'home/search';

  @override
  Map<String, dynamic> get toMap => {'title': title};

  @override
  ResponseBuilder<PostsModel> get responseBuilder =>
      (json) => PostsModel.fromJson(json);
}
