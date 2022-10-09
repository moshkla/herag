import 'package:get/get.dart';

import '../../../core/models/articles_models/article_details_model.dart';

import '../../../core/models/articles_models/article_model.dart';
import '../../../core/routes/routes.dart';
import '../actions/get_articles_action.dart';
import '../actions/get_articles_details_action.dart';

class ArticleController extends GetxController {
  ArticleModel? articleModel;
  ArticleDetailsModel? articleDetailsModel;
  bool articlesLoading = true;

  getArticles() async {
    articleModel = await GetArticlesAction().execute();
    articlesLoading = false;
    update();
  }

  getArticleDetails({required int articleId}) async {
    articleDetailsModel =
        await GetArticleDetailsAction(articleID: articleId).execute();
    articlesLoading = false;
    update();
    Get.toNamed(Routes.articleDetails);
  }
}
