import 'package:api_request/api_request.dart';
import '../../../core/models/articles_models/article_details_model.dart';

class GetArticleDetailsAction extends ApiRequestAction<ArticleDetailsModel> {
  final int articleID;

  GetArticleDetailsAction({required this.articleID});

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => 'posts/$articleID';

  @override
  ResponseBuilder<ArticleDetailsModel> get responseBuilder =>
      (json) => ArticleDetailsModel.fromJson(json);
}
