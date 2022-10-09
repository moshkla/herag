import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/size_config.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../core/models/home_models/home_model.dart';
import '../../../functions/cashed_network_image.dart';
import '../../../theme/app_colors.dart';

class ClientCommentsWidget extends StatelessWidget {
  const ClientCommentsWidget({Key? key, required this.homeModel})
      : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(value: 2),
          Text(
            "clients_review".tr,
            style: context.textTheme.titleLarge!
                .copyWith(color: AppColors.secondary),
          ),
          VerticalSpace(value: 1),
          Text(
            "what_clients_say".tr,
            style: context.textTheme.titleBold.copyWith(color: Colors.black),
          ),
      VerticalSpace(value: 1),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 10),
                    spreadRadius: 2,
                    blurRadius: 30),
              ],
            ),
            height: SizeConfig.defaultSize! * 20,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: homeModel.data!.customerReviews!.length,
                itemBuilder: (c, i) {
                  return SizedBox(
                    width: Get.width * .9,
                    child: Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: SizeConfig.defaultSize! * 5,
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.asset(
                                            'assets/images/one.png'),

                                        // customCachedNetworkImage(
                                        //     url: homeModel.data!.customerReviews![i].image!,
                                        //     context: context,
                                        //     fit: BoxFit.cover),
                                      ),
                                      HorizontalSpace(value: 1),
                                      Column(
                                        children: [
                                          Text(
                                            homeModel.data!.customerReviews![i].name!,
                                            style:
                                                context.textTheme.titleMedium!.copyWith(color: Colors.black),
                                          ),
                                          Text(
                                            homeModel.data!.customerReviews![i].job!,
                                            style:
                                                context.textTheme.caption,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'date',
                                  style: context.textTheme.caption,
                                )
                                // Expanded(
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(
                                //         horizontal: 16.0, vertical: 8),
                                //     child: Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         SmoothStarRating(
                                //           allowHalfRating: true,
                                //           rating: double.parse(homeModel
                                //               .data!.customerReviews![i].rate!
                                //               .toString()),
                                //           color: const Color(0xffFBAB30),
                                //           size: 16,
                                //         ),
                                //         const SizedBox(
                                //           height: 8,
                                //         ),
                                //         Flexible(
                                //           child: AutoSizeText(
                                //             homeModel
                                //                 .data!.customerReviews![i].comment!,
                                //             minFontSize: 10,
                                //             maxFontSize: 16,
                                //             style: context.textTheme.hint,
                                //             maxLines: 5,
                                //             overflow: TextOverflow.ellipsis,
                                //           ),
                                //         ),
                                //         VerticalSpace(value: 1),
                                //         Text(
                                //           homeModel.data!.customerReviews![i].name!,
                                //           style: context.textTheme.subTitleBold,
                                //         ),
                                //         Text(
                                //           homeModel.data!.customerReviews![i].job!,
                                //           style: context.textTheme.hint,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1,
                                height: 1,
                              ),
                            ),
                            SmoothStarRating(
                              allowHalfRating: true,
                              rating: double.parse(homeModel
                                  .data!.customerReviews![i].rate!
                                  .toString()),
                              color: const Color(0xffFBAB30),
                              size: SizeConfig.defaultSize! * 2.3,
                            ),
                            VerticalSpace(value: 1),
                            Text(
                              homeModel.data!.customerReviews![i].comment!,
                              style: context.textTheme.titleBold.copyWith(
                                fontWeight: FontWeight.w200,
                                fontSize: SizeConfig.defaultSize! * 2,
                                color: Colors.black,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
