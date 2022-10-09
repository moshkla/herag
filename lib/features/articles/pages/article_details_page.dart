import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/features/articles/widgets/html_view.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/notification_utils.dart';
import '../../../core/models/articles_models/article_details_model.dart';
import '../../../functions/cashed_network_image.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/size_config.dart';
import '../../../widgets/empty_data.dart';
import '../blocs/articles.controller.dart';

class ArticleDetailsPage extends GetView<ArticleController> {
  const ArticleDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ArticleController>(
        builder: (c) {
          return controller.articlesLoading
              ? NotificationUtils.showLoading()
              : controller.articleDetailsModel!.post == null
                  ? const Center(
                      child: EmptyData(),
                    )
                  : CustomScrollView(
                      slivers: [
                        buildSliverAppBar(
                            context: context,
                            model: controller.articleDetailsModel!),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const VerticalSpace(value: 1),
                                  // Text(
                                  //   LocalStorageUtils.locale=='ar'?
                                  //   controller.articleDetailsModel!.post!
                                  //       .excerpt!.ar!:
                                  // controller.articleDetailsModel!.post!
                                  //   .excerpt!.en!,
                                  //   style: context.textTheme.titleLarge!
                                  //       .copyWith(color: AppColors.textLight),
                                  // ),
                                  HtmlView(
                                      htmlString:
                                          LocalStorageUtils.token == 'ar'
                                              ? controller.articleDetailsModel!
                                                  .post!.content!.ar!
                                              : controller.articleDetailsModel!
                                                  .post!.content!.en!),
                                  const VerticalSpace(value: 30),
                                ],
                              ),
                            ),
                          ]),
                        )
                      ],
                    );
        },
      ),
    );
  }
}

Widget buildSliverAppBar(
    {required BuildContext context, required ArticleDetailsModel model}) {
  final splitted = model.post!.createdAt!.split(' ');

  return SliverAppBar(
    backgroundColor: AppColors.secondary,
    expandedHeight: SizeConfig.defaultSize! * 46,
    pinned: false,
    stretch: false,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(
        LocalStorageUtils.locale == 'ar'
            ? model.post!.title!.ar!
            : model.post!.title!.en!,
        style: context.textTheme.title.copyWith(color: Colors.black),
        textAlign: TextAlign.start,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      background: Container(
        color: Colors.white,
        height: SizeConfig.defaultSize! * 50,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: model.post!.id!,
                  child: Container(
                    height: SizeConfig.defaultSize! * 37.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: customCachedNetworkImage(
                        url: model.post!.image!,
                        fit: BoxFit.cover,
                        context: context),
                  ),
                ),
                Positioned(
                  bottom: SizeConfig.defaultSize! * -2,
                  right: SizeConfig.defaultSize! * 2,
                  child: Container(
                      height: SizeConfig.defaultSize! * 6,
                      width: SizeConfig.defaultSize! * 9,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      color: AppColors.secondary,
                      child: Center(
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: splitted[2],
                                  style: context.textTheme.subTitleBold
                                      .copyWith(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.defaultSize! * 2)),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: splitted[0],
                                  style: context.textTheme.bodyLarge!
                                      .copyWith(color: Colors.white)),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
            const VerticalSpace(value: 3),
          ],
        ),
      ),
    ),
  );
}
