import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';

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
                        translateString('إعادة تعيين كلمة السر', 'Reset password'),
                        style: title,
                      ),
                      const VerticalSpace(value: 2),
                      Text(
                        translateString(' أنشئ كلمة مرور جديده', 'Create new password'),
                        style: title,
                      ),
                      const VerticalSpace(value: 2),
                      TextFormField(
                        style: subTitle,
                        decoration: inputDecoration(
                            label: translateString('كود التحقق', 'Code')),
                      ),
                      const VerticalSpace(value: 2),
                      TextFormField(
                        style: subTitle,
                        decoration: inputDecoration(
                            label: translateString('كلمة المرور الجديدة', 'New password')),
                      ),
                      const VerticalSpace(value: 2),
                      TextFormField(
                        style: subTitle,
                        decoration: inputDecoration(
                            label: translateString('تأكيد كلمة المرور', 'Confirm Password')),
                      ),

                      const VerticalSpace(value: 2),
                      Padding(
                        padding: edgeInsetsSymmetric(h: 5, v: 0),
                        child: CustomGeneralButton(
                            text: translateString('ارسال', 'Send'),
                            onTap: () {
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
