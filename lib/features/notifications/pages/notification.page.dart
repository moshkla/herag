import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herag/core/widgets/page_app_bar.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utiles/size_config.dart';
import '../../../functions/cashed_network_image.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/styles.dart';
import '../../../theme/text_styles.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          pageAppBar(
            pageTitle: translateString("الاشعارات", "Notifications"),
            withoutBackBtn: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (c, i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          width: Si.ds! * 10,
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
                                                          BorderRadius.circular(
                                                    Si.ds! * 5.2,
                                                  )),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child:
                                                      customCachedNetworkImage(
                                                          url: '',
                                                          context: context,
                                                          fit: BoxFit.cover),
                                                )),
                                      HorizontalSpace(value: 1),
                                      Text(
                                        'اسم العميل',
                                        style: titleSmall.copyWith(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: Si.ds! * 1,
                                      child: Text('1'),
                                    ),
                                  )
                                ],
                              ),
                              VerticalSpace(value: 1),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'مرحبا عزيزى العميل',
                                    style: hint.copyWith(color: Colors.grey),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        size: Si.ds! * 2,
                                      ),
                                      HorizontalSpace(value: 1),
                                      Text(
                                        'منذ دقيقة',
                                        style: hint,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                    )),
          ),
        ],
      ),
    );
  }
}
