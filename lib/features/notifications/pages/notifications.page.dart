import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/widgets/page_app_bar.dart';
import 'package:herag/features/chat/pages/chat_details_screen.dart';
import '../../../core/utiles/size_config.dart';
import '../../../functions/cashed_network_image.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/styles.dart';
import '../../../theme/text_styles.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            pageAppBar(
              pageTitle: "notifications".tr(),
              withoutBackBtn: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 10,
                  itemBuilder: (c, i) => InkWell(
                        onTap: () {
                          MagicRouter.navigateTo(ChatDetailsScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: boxDecoration(
                                  withBorder: false, solidColor: Colors.white),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                              radius: Si.ds! * 2.5,
                                              backgroundColor: Colors.white,
                                              child: true
                                                  ? CircleAvatar(
                                                      backgroundColor:
                                                          AppColors.secondary,
                                                      radius: Si.ds! * 2.3,
                                                      child: SvgPicture.asset(
                                                        'assets/images/profile-circle-bold.svg',
                                                        height: Si.ds! * 8,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                        Si.ds! * 5.2,
                                                      )),
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      child:
                                                          customCachedNetworkImage(
                                                              url: '',
                                                              context: context,
                                                              fit:
                                                                  BoxFit.cover),
                                                    )),
                                          const HorizontalSpace(value: 1),
                                          SizedBox(
                                            width: Si.ds! * 24,
                                            child: Text(
                                              '?????? ???????? ???? ???????? ?????? ???????? ???? ???????????? ???? ?????? ?????????????? '
                                              ', ?????? ???? ?????????? ?????? ???????? ???? ???????? ???????? ???????????? ?????? ?????????? ???? ???????? ?????? ?????? ???????? ???? ???????????? ???? ???????????? ',
                                              style: titleSmall.copyWith(
                                                  color: Colors.black),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const VerticalSpace(value: 1),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        size: Si.ds! * 2,
                                      ),
                                      const HorizontalSpace(value: 1),
                                      Text(
                                        '?????? ??????????',
                                        style: hint,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
