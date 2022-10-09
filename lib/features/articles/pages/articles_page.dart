import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/local_storage.utils.dart';
import 'package:majdia/utils/size_config.dart';
import '../../../utils/notification_utils.dart';
import '../../../widgets/article_item.dart';

import '../../../widgets/empty_data.dart';
import '../../home/blocs/home_controller.dart';
import '../blocs/articles.controller.dart';
import 'package:flutter_svg/svg.dart';

class ArticlesPage extends GetView<ArticleController> {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: GetBuilder<ArticleController>(
      initState: (_) {
        if (controller.articleModel == null) {
          Future.microtask(
            () => controller.getArticles(),
          );
        }
      },
      builder: (ctx) {
        return controller.articlesLoading
            ? NotificationUtils.showLoading()
            : controller.articleModel == null
                ? const Center(
                    child: EmptyData(),
                  )
                : Scaffold(
                    body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          if (Get.find<HomeController>().userModel != null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: RichText(
                                      text: TextSpan(
                                          style: context.textTheme.titleLarge!,
                                          children: [
                                            TextSpan(
                                                text:
                                                'hello'.tr + ' ${Get.find<HomeController>().userModel!.profile!.name}\n'
                                                    .tr,
                                                style: context.textTheme.title),
                                            TextSpan(
                                                text: 'in_an_integrated_community'.tr,
                                                style: context.textTheme.titleLarge)
                                          ])),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: new SvgPicture.asset(
                                    'assets/images/notification.svg',
                                    height: SizeConfig.defaultSize! * 3,
                                    color: Colors.black,
                                  ),
                                  color: Colors.white,
                                )
                              ],
                            ),
                          if (LocalStorageUtils.token == null)
                            VerticalSpace(value: SizeConfig.defaultSize! * 0.2),
                          ListView.builder(

                              itemCount: controller.articleModel!.data!.length,
                              shrinkWrap: true,
                              primary: false,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (c, i) {
                                return InkWell(
                                    onTap: () {
                                      controller.getArticleDetails(
                                          articleId:
                                              controller.articleModel!.data![i].id!);
                                    },
                                    child: ArticleItem(
                                      id: controller.articleModel!.data![i].id!,
                                      title: LocalStorageUtils.locale == 'ar'
                                          ? controller
                                              .articleModel!.data![i].title!.ar!
                                          : controller
                                              .articleModel!.data![i].title!.en!,
                                      image: controller.articleModel!.data![i].image!,
                                      shortDesc: LocalStorageUtils.locale == 'ar'
                                          ? controller
                                              .articleModel!.data![i].excerpt!.ar!
                                          : controller
                                              .articleModel!.data![i].excerpt!.en!,
                                      createdAt: controller
                                          .articleModel!.data![i].createdAt!,
                                    ));
                              }),
                        ],
                      ),
                    ),
                  ));
      },
    ));
  }
}
