import 'package:flutter/material.dart';

import '../../features/ad_details/pages/ad.details.page.dart';
import '../../theme/styles.dart';
import '../../theme/text_styles.dart';
import '../router/router.dart';
import '../utiles/size_config.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MagicRouter.navigateTo(const AdDetailsPage());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: Si.ds! * 10,
            decoration: boxDecoration(
              withBorder: true,
            ),
            child: Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    width: Si.ds! * 15,
                    child: Image.asset(
                      'assets/images/ites.png',
                      fit: BoxFit.cover,
                      height: 150,
                    )

                    // customCachedNetworkImage(
                    //     url: '',
                    //     context: context,
                    //     fit: BoxFit.cover,
                    //     color: Colors.green),
                    ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'إستراحة وشاليهات ليالي القمر بالحمراء',
                          style: subTitle.copyWith(color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2,000 sar',
                              style: subTitleBold,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  size: Si.ds! * 2,
                                ),
                                const HorizontalSpace(value: 1),
                                Text(
                                  'منذ دقيقة',
                                  style: hint,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.deepOrange,
                              size: Si.ds! * 2,
                            ),
                            Text('جدة',
                                style: hint.copyWith(
                                  color: Colors.deepOrange,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: Colors.green,
                                  size: Si.ds! * 2,
                                ),
                                Text(
                                  'أبو عدنان',
                                  style: hint.copyWith(color: Colors.green),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                                const HorizontalSpace(value: 2),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
