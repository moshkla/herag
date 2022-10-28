import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';
import 'package:herag/core/models/posts_model.dart';

class AddNewPostAction extends ApiRequestAction<PostsModel> {


  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;


  @override
  String get path => 'post/add';

  @override
  Map<String, dynamic> get toMap => {
    'price': '',
    'title': '',
    'description': '',
    'category_id': '',
    'area_id': '',
    'phone': '',
    'latitude': '',
    'longitude': '',
    'images_collection[]':[]
  };

  @override
  ResponseBuilder<PostsModel> get responseBuilder =>
      (json) => PostsModel.fromJson(json);
}
