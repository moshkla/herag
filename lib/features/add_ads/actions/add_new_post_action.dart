import 'package:api_request/api_request.dart';
import 'package:herag/core/base_response.dart';
import 'package:herag/core/models/posts_model.dart';

class AddNewPostAction extends ApiRequestAction<PostsModel> {
  final String price;
  final String title;
  final String phone;
  final String description;
  final int category_id;
  final int area_id;

  AddNewPostAction({required this.price,required this.title,required this.phone,required this.description,
    required  this.category_id,required this.area_id});

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => 'post/add';

  @override
  Map<String, dynamic> get toMap => {
        'price': price,
        'title': title,
        'description': description,
        'category_id': category_id,
        'area_id': area_id,
        'phone': phone,
        'latitude': '',
        'longitude': '',
        'images_collection[]': []
      };

  @override
  ResponseBuilder<PostsModel> get responseBuilder =>
      (json) => PostsModel.fromJson(json);
}
