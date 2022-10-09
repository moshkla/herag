import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/features/articles/blocs/articles.controller.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/local_storage.utils.dart';
import 'package:majdia/utils/size_config.dart';

import '../../../core/models/home_models/home_model.dart';
import '../../../layout/layout.controller.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/article_item.dart';

class HomeBlogsWidget extends StatelessWidget {
  const HomeBlogsWidget({Key? key, required this.homeModel}) : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          VerticalSpace(value: 2),
          Row(
            children: [
              Text(
                "new_blogs".tr,
                style: context.textTheme.titleLarge,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.find<MainNavigationController>().changeIndex(2);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize!)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text("see_more".tr,
                      style: context.textTheme.subTitle
                          .copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
          VerticalSpace(value: 1),
          SizedBox(
            height: SizeConfig.defaultSize! * 32.5,
            width: Get.width,
            child: ListView.builder(
                itemCount: homeModel.data!.articles!.length,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  var article = homeModel.data!.articles![i];
                  return InkWell(
                    onTap: () {
                      Get.find<ArticleController>().getArticleDetails(
                          articleId: homeModel.data!.articles![i].id!);
                    },
                    child: SizedBox(
                        width: SizeConfig.defaultSize! * 26,
                        child: ArticleItem(
                          id: article.id!,
                          shortDesc: LocalStorageUtils.locale == 'ar'
                              ? article.excerpt!.ar!
                              : article.excerpt!.en!,
                          image: article.image!,
                          title: LocalStorageUtils.locale == 'ar'
                              ? article.title!.ar!
                              : article.title!.en!,
                          createdAt: article.createdAt!,
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }
}
