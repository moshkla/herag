import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/features/auth/blocs/auth.cubit.dart';
import 'package:herag/features/auth/pages/login.page.dart';

import '../../../core/utiles/validator.utils.dart';
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
  final bloc = GetIt.I<AuthCubit>();
  final formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();

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
              child: Form(
                key: formKey,
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
                              controller: name,
                              style: subTitle,
                              validator: ValidatorUtils.req,
                              decoration: inputDecoration(label: 'name'.tr()),
                            ),
                            const VerticalSpace(value: 1.5),
                            TextFormField(
                              controller: email,
                              style: subTitle,
                              validator: ValidatorUtils.email,
                              decoration: inputDecoration(label: 'email'.tr()),
                            ),
                            const VerticalSpace(value: 1.5),
                            TextFormField(
                              style: subTitle,
                              controller: phone,
                              keyboardType: TextInputType.number,
                              validator: ValidatorUtils.phone,
                              decoration: inputDecoration(
                                label: 'phone'.tr(),
                              ),
                            ),
                            const VerticalSpace(value: 1.5),
                            TextFormField(
                              style: subTitle,
                              controller: password,
                              obscureText: true,
                              validator: ValidatorUtils.password,
                              decoration:
                                  inputDecoration(label: 'password'.tr()),
                            ),
                            const VerticalSpace(value: 1.5),
                            const VerticalSpace(value: 1),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                          MagicRouter.navigateTo(
                                              const TermsPage());
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
                                    if (formKey.currentState!.validate()) {
                                      bloc.postRegister(
                                          name: name.text,
                                          email: email.text,
                                          phone: phone.text,
                                          password: password.text);
                                    }
                                  }),
                            ),
                            const VerticalSpace(value: 1),
                            CustomTextButton(
                                text: "have_account".tr(),
                                onPressed: () {
                                  MagicRouter.navigateAndPopAll(
                                      const LoginPage());
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
