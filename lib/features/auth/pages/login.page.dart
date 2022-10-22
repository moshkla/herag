import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/features/auth/blocs/auth.cubit.dart';
import 'package:herag/features/auth/pages/register.page.dart';

import '../../../layout/layout.page.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/input_decoration.dart';
import '../../../theme/styles.dart';
import '../../../theme/text_styles.dart';
import 'forget.password.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int? selectedIndex;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final bloc = GetIt.I<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    Si().init(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (c, s) {
        return Scaffold(
          body: Container(
            height: Si.screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.cover),
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
                            'login'.tr(),
                            style: title,
                          ),
                          const VerticalSpace(value: 2),
                          TextFormField(
                            controller: emailController,
                            style: subTitle,
                            decoration:
                                inputDecoration(label: 'email_or_phone'.tr()),
                          ),
                          const VerticalSpace(value: 2),
                          TextFormField(
                            controller: passwordController,
                            style: subTitle,
                            decoration: inputDecoration(label: 'password'.tr()),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: CustomTextButton(
                                text: 'forget_password'.tr(),
                                size: Si.ds! * 3,
                                onPressed: () {
                                  MagicRouter.navigateTo(
                                      const ForgetPasswordPage());
                                }),
                          ),
                          const VerticalSpace(value: 2),
                          Padding(
                            padding: edgeInsetsSymmetric(h: 5, v: 0),
                            child: CustomGeneralButton(
                                text: 'login'.tr(),
                                onTap: () {
                                  MagicRouter.navigateAndPopAll(
                                      const LayoutPage());
                                }),
                          ),
                          const VerticalSpace(value: 1),
                          CustomTextButton(
                              text: 'create_new_account'.tr(),
                              onPressed: () {
                                bloc.postLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                                MagicRouter.navigateTo(const RegisterPage());
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
      },
    );
  }
}
