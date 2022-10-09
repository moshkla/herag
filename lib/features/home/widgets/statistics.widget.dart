import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';

import '../../../core/models/home_models/home_model.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({Key? key, required this.homeModel}) : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: Color(0xff22262A),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            "buildings_statistics".tr,
            style: context.textTheme.titleBold.copyWith(color: Colors.white),
          ),
          Text(
            "2022_percentage".tr,
            style: context.textTheme.subTitle.copyWith(color: Colors.white),
          ),
          GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 16,
              children: List.generate(
                homeModel.data!.statistics!.length,
                (index) => _buildStaticsItem(
                    homeModel.data!.statistics![index].title!,
                    homeModel.data!.statistics![index].percentage!),
              )
              ),
          Image.asset("assets/images/back.png")
        ],
      ),
    );
  }

  _buildStaticsItem(String title, String value) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        // height: 150,
        // width: 150,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff272B2F),
                Color(0xff22262A),
              ]),
          shape: BoxShape.circle,
        ),
        child: Container(
          alignment: Alignment.center,
          // height: 120,
          // width: 120,
          padding: const EdgeInsets.all(20),

          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff3D4144),
                  Color(0xff22262A),
                ]),
            shape: BoxShape.circle,
          ),
          child: Container(
            alignment: Alignment.center,
            // height: 90,
            // width: 90,
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff6A6D6F),
                    Color(0xff22262A),
                  ]),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$value%",
                  style: Get.textTheme.titleBold.copyWith(color: Colors.white),
                ),
                Text(
                  title.tr,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.title.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
