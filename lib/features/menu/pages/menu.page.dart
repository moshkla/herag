import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/features/auth/blocs/auth.cubit.dart';
import 'package:herag/features/menu/pages/terms_and_conditions_page.dart';
import 'package:herag/theme/text_styles.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/page_app_bar.dart';
import '../../../theme/app_colors.dart';


import '../../auth/pages/splash.page.dart';
import 'common_questions_page.dart';
import 'contact_us.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Si.screenHeight,
        child: Column(
          children: [
            pageAppBar(pageTitle: 'menu'.tr(),withoutBackBtn: true,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const VerticalSpace(value: 2),
                  InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(const ContactUs());
                    },
                    child: const ProfileCardItem(
                      icon: 'assets/images/call.png',
                      title: 'تواصل معنا',
                    ),
                  ),
                  const VerticalSpace(value: 1.5),
                  InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(const CommonQuestions());
                    },
                    child: const ProfileCardItem(
                      icon: 'assets/images/ask.png',
                      title: 'أسألة متكررة',
                    ),
                  ),
                  const VerticalSpace(value: 1.5),
                  const ProfileCardItem(
                    icon: 'assets/images/settings.png',
                    title: 'الاعدادات',
                  ),
                  const VerticalSpace(value: 1.5),
                  InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(const TermsAndConditions());
                    },
                    child: const ProfileCardItem(
                      icon: 'assets/images/!.png',
                      title: 'سياسة التطبيق',
                    ),
                  ),
                  const VerticalSpace(value: 1.5),
                  BlocBuilder(
                    bloc: GetIt.I<AuthCubit>(),
                  builder: (c,s){
                    return InkWell(
                      onTap: (){
                        GetIt.I<AuthCubit>().logOut();
                      //  MagicRouter.navigateAndPopAll(SplashPage());

                      },
                      child: const ProfileCardItem(
                        icon: 'assets/images/exit.png',
                        title: 'تسجيل الخروج',
                      ),
                    );
                  },
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
