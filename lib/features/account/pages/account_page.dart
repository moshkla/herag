import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herag/core/widgets/page_app_bar.dart';
import 'package:herag/theme/app_colors.dart';
import 'package:herag/theme/text_styles.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/home.item.dart';
import '../../../functions/cashed_network_image.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

        children: [
          SizedBox(
            height: Si.ds! * 12,
            width: Si.screenWidth,
            child: Stack(
              children: [
                pageAppBar(
                  pageTitle: 'my_account'.tr(),
                  withoutBackBtn: true,
                ),
                PositionedDirectional(
                  top: Si.ds! * 6,
                  child: SizedBox(
                    width: Si.screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: Si.ds! * 4,
                              width: Si.ds! * 4,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: AppColors.primary,
                              )),
                          Row(
                            children: [
                              Container(
                                  height: Si.ds! * 4,
                                  width: Si.ds! * 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(Icons.share, color: Colors.green)),
                              const HorizontalSpace(value: 1),
                              Container(
                                  height: Si.ds! * 4,
                                  width: Si.ds! * 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.menu_outlined,
                                    color: AppColors.primary,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: AppColors.primary.withOpacity(0.2),
            height: Si.ds! * 15,
            width: Si.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: Si.ds! * 4,
                    backgroundColor: Colors.white,
                    child: true
                        ? CircleAvatar(
                            backgroundColor: AppColors.secondary,
                            radius: Si.ds! * 3.8,
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
                                url: '', context: context, fit: BoxFit.cover),
                          )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'أنس عبدالعظيم',
                      style: title,
                    ),
                    const VerticalSpace(value: 0.5),
                    Text(
                      '@Mtwereen.com',
                      style: subTitle.copyWith(color: Colors.black),
                    ),
                    const VerticalSpace(value: 0.5),

                    Row(
                      children: [
                        Text(
                          '30 متابع',
                          style: subHint,
                        ),
                        const HorizontalSpace(value: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const HorizontalSpace(value: 0.5),
                            Text(
                              '(4.5)',
                              style: subHint,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  height: Si.ds! * 6,
                  color: AppColors.primary.withOpacity(0.5),
                  width: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: Si.ds! * 2,
                          color: AppColors.primary,
                        ),
                        Text(
                          ' النسيم الشرقي - الرياض',
                          style: subHint.copyWith(fontSize: Si.ds! * 2),
                        )
                      ],
                    ),
                    const VerticalSpace(value: 1),

                    Row(
                      children: [
                        Icon(
                          Icons.file_download_done,
                          size: Si.ds! * 2,
                          color: Colors.green,
                        ),
                        Text(
                          ' ادفع عمولة',
                          style: subHint.copyWith(fontSize: Si.ds! * 2,color: Colors.green),
                        )
                      ],
                    ),
                    const VerticalSpace(value: 1),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: Si.ds! * 2,
                          color: AppColors.primary,
                        ),
                        Text(
                          'قبل 5 شهور',
                          style: subHint.copyWith(fontSize: Si.ds! * 2),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child: ListView.builder(
          //       shrinkWrap: true,
          //       primary: false,
          //       itemCount: 10,
          //       itemBuilder: (c, i) => const HomeItem()),
          // ),
        ],
      ),
    );
  }
}
