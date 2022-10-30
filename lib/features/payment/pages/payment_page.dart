import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/core/widgets/page_app_bar.dart';

import '../../../theme/app_colors.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          pageAppBar(pageTitle: 'دفع العمولة'),
          VerticalSpace(value: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                    child: CustomGeneralButton(
                  text: 'دفع عمو لة',
                  onTap: () {},
                  color: AppColors.primary,
                )),
                HorizontalSpace(value: 2),
                Expanded(
                    child: CustomGeneralButton(
                  text: 'حساب عمولة',
                  textColor: AppColors.primary,
                  onTap: () {},
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
