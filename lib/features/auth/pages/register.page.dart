import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/features/auth/pages/login.page.dart';

import '../../../layout/layout.page.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/input_decoration.dart';
import '../../../theme/styles.dart';
import '../../../theme/text_styles.dart';
import 'terms_conditions.page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int? selectedIndex;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Si().init(context);
    return Scaffold(
      body: Container(
        height: Si.screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: Si.ds! * 8, end: Si.ds! * 8, top: Si.ds! * 6),
                child: Center(
                  child: Image.asset(AppAssets.logo),
                ),
              ),
              Padding(
                padding: edgeInsetsSymmetric(h: 2, v: 5),
                child: Container(
                  padding: edgeInsetsSymmetric(h: 2, v: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Si.ds!),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'create_new_account'.tr(),
                        style: title,
                      ),
                      const VerticalSpace(value: 2),
                      TextFormField(
                        style: subTitle,
                        decoration: inputDecoration(
                            label:
                            'email'.tr()),
                      ),
                      const VerticalSpace(value: 1.5),
                      TextFormField(
                        style: subTitle,
                        decoration: inputDecoration(
                            label:
                            'email'.tr()),
                      ),
                      const VerticalSpace(value: 1.5),
                      TextFormField(
                        style: subTitle,
                        keyboardType: TextInputType.number,
                        decoration: inputDecoration(
                          label: 'phone'.tr(),
                        ),
                      ),
                      const VerticalSpace(value: 1.5),
                      TextFormField(
                        style: subTitle,
                        decoration: inputDecoration(
                            label: 'password'.tr()),
                      ),
                      const VerticalSpace(value: 1.5),
                      TextFormField(
                        style: subTitle,
                        decoration: inputDecoration(
                            label: 'confirm_password'.tr()),
                      ),
                      const VerticalSpace(value: 1),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    isChecked = value!;
                                    setState(() {});
                                  }),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    MagicRouter.navigateTo(const TermsPage());
                                  },
                                  child: Text(
                                    ' بالتسجيل انت توافق علي الشروط والاحكام',
                                    style: subTitle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpace(value: 2),
                      Padding(
                        padding: edgeInsetsSymmetric(h: 5, v: 0),
                        child: CustomGeneralButton(
                            text: 'create_new_account'.tr(),
                            onTap: () {
                              MagicRouter.navigateAndPopAll(const LayoutPage());
                            }),
                      ),
                      const VerticalSpace(value: 1),
                      CustomTextButton(
                          text:  "have_account".tr(),
                          onPressed: () {
                            MagicRouter.navigateAndPopAll(const LoginPage());
                          }),
                    ],
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
