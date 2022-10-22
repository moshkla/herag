import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/theme/text_styles.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/page_app_bar.dart';
import '../../../theme/app_colors.dart';


import 'commition_agreement_page.dart';

class AddAdsPage extends StatelessWidget {
  const AddAdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              pageAppBar(
                  pageTitle:
                  "select_ad_type".tr()),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (c, index) => InkWell(
                  onTap: () {
                    MagicRouter.navigateTo(const CommissionAgreement());
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: ProfileCardItem(
                      icon: 'assets/images/call.png',
                      title: 'اعلان',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCardItem extends StatelessWidget {
  final String title;
  final Color? color;
  final String icon;

  const ProfileCardItem(
      {Key? key, required this.title, this.color, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: h * 0.07,
      padding: EdgeInsets.only(left: w * 0.02, right: w * 0.02),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        // color ?? context.textTheme.title.color,
        borderRadius: BorderRadius.circular(w * 0.02),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Image.asset(
                  icon,
                  height: Si.ds! * 3,
                ),
              ),
              const HorizontalSpace(value: 1),
              Text(title, style: subTitle
                  // color != null ? Colors.white :  context.textTheme.themeStyleText.color),
                  ),
            ],
          ),
          Icon(Icons.arrow_forward_ios,
              size: Si.ds! * 2, color: AppColors.primary
              //color != null ? Colors.white :  context.textTheme.themeStyleText.color,
              ),
        ],
      ),
    );
  }
}
