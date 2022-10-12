import 'package:flutter/material.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/features/menu/pages/terms_and_conditions_page.dart';
import 'package:herag/theme/text_styles.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/page_app_bar.dart';
import '../../../theme/app_colors.dart';

import 'package:flutter_svg/svg.dart';

import 'common_questions_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Si.screenHeight,
        child: Column(
          children: [
            pageAppBar(pageTitle: translateString("القائمة", "Menu")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  VerticalSpace(value: 2),
                  ProfileCardItem(
                    icon: 'assets/images/call.png',
                    title: 'تواصل معنا',
                  ),
                  VerticalSpace(value: 1.5),
                  InkWell(
                    onTap: (){
                      MagicRouter.navigateTo(CommonQuestions());
                    },
                    child: ProfileCardItem(
                      icon: 'assets/images/ask.png',
                      title: 'أسألة متكررة',
                    ),
                  ),
                  VerticalSpace(value: 1.5),
                  ProfileCardItem(
                    icon: 'assets/images/settings.png',
                    title: 'الاعدادات',
                  ),
                  VerticalSpace(value: 1.5),
                  InkWell(
                    onTap: (){
                      MagicRouter.navigateTo(TermsAndConditions());
                    },
                    child: ProfileCardItem(
                      icon: 'assets/images/!.png',
                      title: 'سياسة التطبيق',
                    ),
                  ),
                  VerticalSpace(value: 1.5),
                  ProfileCardItem(
                    icon: 'assets/images/exit.png',
                    title: 'تسجيل الخروج',
                  ),
                ],
              ),
            ),
          ],
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Image.asset(
                  icon,
                  height: Si.ds! * 3,
                ),
              ),
              HorizontalSpace(value: 1),
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
