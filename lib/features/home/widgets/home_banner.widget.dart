import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:majdia/features/home/blocs/home_controller.dart';
import 'package:majdia/theme/text_styles.dart';
import '../../../core/models/home_models/home_model.dart';
import '../../../functions/cashed_network_image.dart';
import '../../../utils/local_storage.utils.dart';
import '../../../utils/size_config.dart';
import 'package:flutter_svg/svg.dart';

import '../../auth/blocs/auth.controller.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({Key? key, required this.homeModel}) : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: CarouselSlider.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index, int realIndex) =>
                      Center(
                        child: Container(
                          height: SizeConfig.defaultSize! * 20,
                          width: SizeConfig.defaultSize! * 38,
                          decoration: BoxDecoration(
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: SizeConfig.defaultSize! * 20,
                                width: SizeConfig.defaultSize! * 38,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.defaultSize! * 1),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: customCachedNetworkImage(
                                    url: homeModel.data!.slides![index].image!,
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
                                          ? homeModel
                                              .data!.slides![index].title!.ar!
                                          : homeModel
                                              .data!.slides![index].title!.en!,
                                      style: context.textTheme.title.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    VerticalSpace(value: 1),
                                    SizedBox(
                                        width: SizeConfig.defaultSize! * 21,
                                        child: Text(
                                            LocalStorageUtils.locale == 'ar'
                                                ? homeModel.data!.slides![index]
                                                    .description!.ar!
                                                : homeModel.data!.slides![index]
                                                    .description!.en!,
                                            style: context.textTheme.caption!
                                                .copyWith(color: Colors.white))),
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
                  options: CarouselOptions(
                      viewportFraction: 1,

                      // enlargeCenterPage: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlay: true)),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  homeCart(
                      image: 'assets/images/building.png',
                      num: homeModel
                          .data!.content!.realEstateStats!.stats![0].value.toString(),
                      title: LocalStorageUtils.locale == 'ar'
                          ? homeModel
                              .data!.content!.realEstateStats!.stats![0].ar!
                          : homeModel
                              .data!.content!.realEstateStats!.stats![0].en!),
                  homeCart(
                      image: 'assets/images/building2.png',
                      num: homeModel
                          .data!.content!.realEstateStats!.stats![1].value.toString(),
                      title:LocalStorageUtils.locale == 'ar'
                          ? homeModel
                          .data!.content!.realEstateStats!.stats![1].ar!
                          : homeModel
                          .data!.content!.realEstateStats!.stats![1].en!),
                  homeCart(
                      image: 'assets/images/house.png',
                      num: homeModel
                          .data!.content!.realEstateStats!.stats![2].value.toString(),
                      title: LocalStorageUtils.locale == 'ar'
                          ? homeModel
                          .data!.content!.realEstateStats!.stats![2].ar!
                          : homeModel
                          .data!.content!.realEstateStats!.stats![2].en!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget homeCart(
      {required String image, required String num, required String title}) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize!),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1),
            color: Colors.white),
        width: SizeConfig.defaultSize!*12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: SizeConfig.defaultSize! * 3,
            ),
            VerticalSpace(value: 1),
            Text(
              num,
              style: Get.context!.textTheme.titleLarge,
            ),
            Text(
              title,
              style: Get.context!.textTheme.title
                  .copyWith(fontSize: SizeConfig.defaultSize! * 1.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

