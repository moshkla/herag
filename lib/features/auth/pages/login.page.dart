import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/core/widgets/custom_text_field.dart';
import 'package:herag/features/auth/pages/register.page.dart';

import '../../../layout/layout.page.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/input_decoration.dart';
import '../../../theme/styles.dart';
import '../../../theme/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        translateString('تسجيل الدخول', 'Login'),
                        style: title,
                      ),
                      VerticalSpace(value: 2),
                      TextFormField(
                        style: subTitle,
                        decoration: inputDecoration(label:translateString('البريد الالكتروني او الهاتف', 'Email or Phone') ),
                      ),
                      VerticalSpace(value: 2),
                      TextFormField(
                        style:subTitle ,
                        decoration: inputDecoration(label:translateString('كلمة المرور', 'Password') ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: CustomTextButton(text: translateString('هل نسيت كلمة المرور ؟','Do you forget passsword ?'),size: Si.ds!*3, onPressed: (){

                        }),
                      ),
                      VerticalSpace(value: 2),
                      Padding(
                        padding: edgeInsetsSymmetric(h:5,v: 0 ),
                        child: CustomGeneralButton(
                            text: translateString('تسجيل الدخول', 'Login'), onTap: () {
                              MagicRouter.navigateAndPopAll(LayoutPage());
                        }),
                      ),
                      VerticalSpace(value: 1),
                      CustomTextButton(text: translateString('انشاء حساب جديد','Create new account'), onPressed: (){
                        MagicRouter.navigateTo(RegisterPage());
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
