import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/features/auth/blocs/auth.cubit.dart';

import '../../../layout/layout.page.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/input_decoration.dart';
import '../../../theme/styles.dart';
import '../../../theme/text_styles.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  int? selectedIndex;
  var code = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

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
                        'reset_password'.tr(),
                        style: title,
                      ),
                      const VerticalSpace(value: 2),
                      Text(
                        'create_new_password'.tr(),
                        style: title,
                      ),
                      const VerticalSpace(value: 2),
                      TextFormField(
                        style: subTitle,
                        controller: code,
                        decoration: inputDecoration(label: 'code'.tr()),
                      ),
                      const VerticalSpace(value: 2),
                      TextFormField(
                        style: subTitle,
                        controller: password,
                        decoration: inputDecoration(label: 'new_password'.tr()),
                      ),
                      const VerticalSpace(value: 2),
                      TextFormField(
                        style: subTitle,
                        controller: confirmPassword,
                        decoration:
                            inputDecoration(label: 'confirm_password'.tr()),
                      ),
                      const VerticalSpace(value: 2),
                      Padding(
                        padding: edgeInsetsSymmetric(h: 5, v: 0),
                        child: CustomGeneralButton(
                            text: 'send'.tr(),
                            onTap: () {
                              GetIt.I<AuthCubit>().updatePassword(code.text,
                                  password.text, confirmPassword.text);
                              MagicRouter.navigateAndPopAll(const LayoutPage());
                            }),
                      ),
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
