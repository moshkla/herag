import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/functions/open_links.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/local_storage.utils.dart';

import '../../../core/models/home_models/home_model.dart';
import '../../../functions/cashed_network_image.dart';
import '../../../utils/size_config.dart';

class HomeAdWidget extends StatelessWidget {
  const HomeAdWidget({Key? key, required this.homeModel}) : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index, int realIndex) =>
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.defaultSize!)
                  ),
                  elevation: 1,
                  child: Center(
                    child: Container(
                      height: SizeConfig.defaultSize! * 25,
                      width: SizeConfig.defaultSize! * 38,
                      child: Stack(
                        children: [
                          Container(
                            height: SizeConfig.defaultSize! * 25,
                            width: SizeConfig.defaultSize! * 38,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.defaultSize! * 1),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: customCachedNetworkImage(
                                url:homeModel.data!.ads![index].image!,
                                //   'http://almajdiahresidence.com//Magdiah/150_b8e3fd9c-44d1-4473-91b1-82e178a3cceb.jpg',
                                context: context,
                                fit: BoxFit.cover),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.defaultSize! * 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  LocalStorageUtils.locale == 'ar'
                                      ? homeModel.data!.ads![index].title!.ar!
                                      : homeModel.data!.ads![index].title!.en!,
                                  style: context.textTheme.title.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                VerticalSpace(value: 1),
                                SizedBox(
                                    width: SizeConfig.defaultSize! * 21,
                                    child: Text(
                                        LocalStorageUtils.locale == 'ar'
                                            ? homeModel.data!.ads![index].description!.ar!
                                            : homeModel.data!.ads![index].description!.en!,
                                        style: context.textTheme.caption!
                                            .copyWith(color: Colors.white),maxLines: 6,
                                    overflow: TextOverflow.ellipsis,)),
                                VerticalSpace(value: 1),
                                Row(
                                  children: [
                                    Text(
                                      'اطلب الان',
                                      style: context.textTheme.titleSmall!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        options: CarouselOptions(
            viewportFraction: 1,

            // enlargeCenterPage: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlay: true));





    //   SizedBox(
    //   height: Get.height * .35,
    //   width: Get.width,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 15.0),
    //     child: SizedBox(
    //       height: Get.height * .20,
    //       width: Get.width,
    //       child: CarouselSlider.builder(
    //           itemCount: homeModel.data!.ads!.length,
    //           itemBuilder: (c, i, _) {
    //             return InkWell(
    //               onTap: () {
    //                 openEngine(homeModel.data!.ads![i].link);
    //                 // Get.toNamed(Routes.ads,
    //                 //     arguments: homeModel.data!.ads![i]);
    //               },
    //               child: Stack(
    //                 children: [
    //                   customCachedNetworkImage(
    //                       url: homeModel.data!.ads![i].image!,
    //                       context: context,
    //                       fit: BoxFit.cover),
    //                   Positioned(
    //                     top: SizeConfig.defaultSize! * 18,
    //                     left: SizeConfig.defaultSize! * 2,
    //                     right: SizeConfig.defaultSize! * 2,
    //                     child: SizedBox(
    //                       width: Get.width * .5,
    //                       child: Center(
    //                         child: Container(
    //                           padding: const EdgeInsets.symmetric(
    //                               horizontal: 8, vertical: 6),
    //                           decoration: BoxDecoration(
    //                             color: Colors.transparent.withOpacity(.5),
    //                             borderRadius: BorderRadius.circular(2),
    //                           ),
    //                           child: Text(
    //                             LocalStorageUtils.locale == 'ar'
    //                                 ? homeModel.data!.ads![i].description!.ar!
    //                                 : homeModel.data!.ads![i].description!.en!,
    //                             textAlign: TextAlign.center,
    //                             style: context.textTheme.hint
    //                                 .copyWith(color: Colors.white, height: 1.5),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     top: SizeConfig.defaultSize! * 14,
    //                     left: SizeConfig.defaultSize! * 3,
    //                     right: SizeConfig.defaultSize! * 3,
    //                     child: SizedBox(
    //                       width: Get.width * .5,
    //                       child: Center(
    //                         child: Container(
    //                           padding: const EdgeInsets.symmetric(
    //                               horizontal: 8, vertical: 6),
    //                           decoration: BoxDecoration(
    //                             color: Colors.transparent.withOpacity(.5),
    //                             borderRadius: BorderRadius.circular(2),
    //                           ),
    //                           child: Text(
    //                             LocalStorageUtils.locale == 'ar'
    //                                 ? homeModel.data!.ads![i].title!.ar!
    //                                 : homeModel.data!.ads![i].title!.en!,
    //                             textAlign: TextAlign.center,
    //                             style: context.textTheme.hint
    //                                 .copyWith(color: Colors.white, height: 1.5),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             );
    //           },
    //           options: CarouselOptions(
    //               viewportFraction: 1,
    //
    //               // enlargeCenterPage: true,
    //               autoPlayAnimationDuration: const Duration(seconds: 1),
    //               autoPlay: true)),
    //     ),
    //   ),
    // );
  }
}
