import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/functions/cashed_network_image.dart';
import 'package:majdia/functions/open_links.dart';
import 'package:majdia/theme/text_styles.dart';
import 'package:majdia/utils/local_storage.utils.dart';
import 'package:majdia/utils/size_config.dart';

import '../../../core/models/home_models/home_model.dart';
import '../../../theme/app_colors.dart';

class PartnersWidget extends StatelessWidget {
  const PartnersWidget({Key? key, required this.homeModel}) : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(value: 2),
          Text(
            "success_partners".tr,
            style: context.textTheme.titleLarge!
                .copyWith(color: AppColors.secondary),
          ),
          VerticalSpace(value: 1),
          Text(
            LocalStorageUtils.locale == 'ar'
                ? homeModel.data!.content!.successPartner!.title!.ar!
                : homeModel.data!.content!.successPartner!.title!.en!,
            style: context.textTheme.titleBold.copyWith(color: Colors.black),
          ),
          VerticalSpace(value: 1),
          Text(
            LocalStorageUtils.locale == 'ar'
                ? homeModel.data!.content!.successPartner!.description!.ar!
                : homeModel.data!.content!.successPartner!.description!.en!,
            style: context.textTheme.hint,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,

                  shrinkWrap: true,
                  primary: false,
                  itemCount: homeModel.data?.successPartners?.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      openEngine(homeModel.data?.successPartners![index].url);
                    },
                    child: HoverableImage(
                      asset: homeModel.data?.successPartners![index].image,
                    ),
                  ),
                ),
              )

              // GridView.count(
              //   crossAxisCount: 3,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   children: [
              //     ...List<Widget>.generate(
              //         homeModel.data?.successPartners?.length ?? 0, (index) {
              //       return InkWell(
              //         onTap: () {
              //           openEngine(homeModel.data?.successPartners![index].url);
              //         },
              //         child: HoverableImage(
              //           asset: homeModel.data?.successPartners![index].image,
              //         ),
              //       );
              //     })
              //   ],
              // ),
              ),
        ],
      ),
    );
  }
}

class HoverableImage extends StatefulWidget {
  const HoverableImage({Key? key, required this.asset}) : super(key: key);
  final String? asset;

  @override
  State<HoverableImage> createState() => _HoverableImageState();
}

class _HoverableImageState extends State<HoverableImage> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (value) {
        hovered = true;
        setState(() {});
      },
      onTapUp: (value) {
        hovered = false;
        setState(() {});
      },
      onTapCancel: () {
        hovered = false;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: Card(
          elevation: 1,
          child: Container(
            height: 100,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1)
              ),
              child: customCachedNetworkImage(
                  url: widget.asset!,
                  context: context,
              fit: BoxFit.fitWidth)),
        ),
        //widget.asset
        // SvgPicture.asset(
        //   widget.asset,
        //   color: hovered ? null : Colors.grey,
        // ),
      ),
    );
  }
}
