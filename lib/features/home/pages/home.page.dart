import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/core/widgets/home.item.dart';
import 'package:herag/theme/input_decoration.dart';
import 'package:herag/theme/styles.dart';

import '../../../core/utiles/size_config.dart';
import '../../../functions/cashed_network_image.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_styles.dart';
import '../../ad_details/pages/ad.details.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Si.ds! * 25,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/home_bg.png',
                  height: Si.ds! * 25,
                  fit: BoxFit.cover,
                ),
                PositionedDirectional(
                  top: Si.ds! * 5,
                  start: Si.ds!,
                  end: Si.ds!,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: Si.ds! * 3,
                              backgroundColor: Colors.white,
                              child: true
                                  ? CircleAvatar(
                                      backgroundColor: AppColors.secondary,
                                      radius: Si.ds! * 2.8,
                                      child: SvgPicture.asset(
                                        'assets/images/profile-circle-bold.svg',
                                        height: Si.ds! * 8,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                        Si.ds! * 5.2,
                                      )),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: customCachedNetworkImage(
                                          url: '',
                                          context: context,
                                          fit: BoxFit.cover),
                                    )),
                          HorizontalSpace(value: 1),
                          Text(
                            translateString('اهلا أنس', 'Hello Anas'),
                            style: title.copyWith(color: Colors.white),
                          ),
                          HorizontalSpace(value: 1),
                          Image.asset(
                            'assets/images/hi.png',
                            height: Si.ds! * 3,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/bell.png',
                            height: Si.ds! * 3,
                          ),
                          HorizontalSpace(value: 1),
                          Container(
                            padding: edgeInsetsSymmetric(v: 0, h: 1),
                            decoration: boxDecoration(
                                withBorder: true,
                                solidColor: Colors.white,
                                radius: Si.ds! * 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.primary,
                                ),
                                Text(
                                  'جدة',
                                  style:
                                      title.copyWith(color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PositionedDirectional(
                  top: Si.ds! * 15,
                  start: Si.ds!,
                  end: Si.ds!,
                  child: Container(
                    height: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'ابحث',
                        hintStyle: subTitle,
                        contentPadding: edgeInsetsSymmetric(v: 1, h: 2),
                        suffixIcon: Container(
                          height: Si.ds! * 10,
                          width: Si.ds! * 10,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/filter.png',
                                height: 30,
                              ),
                              HorizontalSpace(value: 1),
                              Image.asset(
                                'assets/images/search.png',
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Si.ds! * 5),
                            borderSide: BorderSide(
                                color: AppColors.primary,
                                style: BorderStyle.solid,
                                width: 1)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          VerticalSpace(value: 1),
          SizedBox(
            height: Si.ds! * 10,
            width: Si.screenWidth,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (c, i) => Container(
                      height: Si.ds! * 5,
                      width: Si.ds! * 10,
                      decoration: boxDecoration(
                          withBorder: true,
                          solidColor: AppColors.primary.withOpacity(0.2)),
                      child: Column(
                        children: [
                          if (i != 0)
                            Container(
                              height: Si.ds! * 5,
                              child: customCachedNetworkImage(
                                  url: '', context: context, fit: BoxFit.cover),
                              color: AppColors.primary,
                            ),
                          Text('data',
                              style:
                                  subTitle.copyWith(color: AppColors.primary)),
                        ],
                      ),
                    )),
          ),
          VerticalSpace(value: 1),
          SizedBox(
            height: Si.ds! * 5,
            width: Si.screenWidth,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (c, i) => Container(
                      width: Si.ds! * 10,
                      decoration: boxDecoration(
                          withBorder: true,
                          solidColor: AppColors.primary.withOpacity(0.2)),
                      child: Center(
                        child: Text('data',
                            style: subTitle.copyWith(color: Colors.black)),
                      ),
                    )),
          ),
          VerticalSpace(value: 1),
          Container(
            height: Si.ds! * 20,
            color: Colors.green,
            child: Stack(
              children: [
                Container(
                  height: Si.ds! * 20,
                  child: customCachedNetworkImage(
                      url: '', context: context, fit: BoxFit.cover),
                ),
                PositionedDirectional(
                  end: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: Si.ds! * 20,
                    width: Si.ds! * 20,
                    color: Colors.black.withOpacity(0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Si.ds! * 20,
                          child: Text(
                            'احجز قاعتك معنا خصم 30%',
                            style: title.copyWith(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26.0),
                          child: CustomGeneralButton(
                              text: 'احجز الان', onTap: () {}),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (c, i) => InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(AdDetailsPage());
                    },
                    child: HomeItem())),
          ),
        ],
      ),
    );
  }
}
