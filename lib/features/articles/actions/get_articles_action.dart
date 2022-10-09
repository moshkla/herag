import 'package:api_request/api_request.dart';

import '../../../core/models/articles_models/article_model.dart';

class GetArticlesAction extends ApiRequestAction<ArticleModel> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'posts';

  @override
  ResponseBuilder<ArticleModel> get responseBuilder =>
      (json) => ArticleModel.fromJson(json);
}

