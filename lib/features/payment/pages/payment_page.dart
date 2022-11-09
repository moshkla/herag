import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/core/widgets/page_app_bar.dart';
import 'package:herag/theme/input_decoration.dart';
import 'package:herag/theme/text_styles.dart';

import '../../../theme/app_colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int type = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const pageAppBar(pageTitle: 'دفع العمولة'),
          VerticalSpace(value: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                    child: CustomGeneralButton(
                  text: 'دفع عمو لة',
                  onTap: () {
                    setState(() {
                      type = 0;
                    });
                  },
                  color: type == 0 ? AppColors.primary : Colors.transparent,
                  textColor: type == 0 ? Colors.white : AppColors.primary,
                )),
                const HorizontalSpace(value: 2),
                Expanded(
                    child: CustomGeneralButton(
                  text: 'حساب عمولة',
                  onTap: () {
                    setState(() {
                      type = 1;
                    });
                  },
                  color: type == 1 ? AppColors.primary : Colors.transparent,
                  textColor: type == 1 ? Colors.white : AppColors.primary,
                )),
              ],
            ),
          ),
          VerticalSpace(value: 2),
          if (type == 0)
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(children: [
                      Text(
                        'ادخل سعر العمولة',
                        style: subTitle,
                      ),
                      HorizontalSpace(value: 2),
                      Expanded(
                        child: TextFormField(
                          style: title,
                          decoration: inputDecoration(),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          if (type == 1)
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(children: [
                      Text(
                        'ادخل سعر العمولة',
                        style: subTitle,
                      ),
                      HorizontalSpace(value: 2),
                      Expanded(
                        child: TextFormField(
                          style: title,
                          decoration: inputDecoration(),
                        ),
                      )
                    ]),
                  ),
                  VerticalSpace(value: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(children: [
                      Text(
                        'العمولة المستحقة',
                        style: subTitle,
                      ),
                      HorizontalSpace(value: 2),
                      Expanded(
                        child: TextFormField(
                          style: title,
                          decoration: inputDecoration(),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
