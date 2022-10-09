import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';

import '../../../theme/input_decoration.dart';
import '../../../widgets/custom_button.dart';
import '../blocs/reset_password_form_bloc.dart';


class ResetPasswordWidget extends StatefulWidget {

  const ResetPasswordWidget({Key? key}) : super(key: key);

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  ResetPasswordFormBloc formBloc = ResetPasswordFormBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: FormBlocListener(
        formBloc: formBloc,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "reset_pass".tr,
                style: context.textTheme.titleBold,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFieldBlocBuilder(
                key: const ValueKey("email"),
                textFieldBloc: formBloc.email,
                decoration: inputDecoration(label: "email".tr),
              ),
              TextFieldBlocBuilder(
                key: const ValueKey("code"),
                textFieldBloc: formBloc.code,
                decoration: inputDecoration(label: "code_6".tr),
              ),

              TextFieldBlocBuilder(
                key: const ValueKey("password"),
                textFieldBloc: formBloc.password,
                decoration: inputDecoration(label: "password".tr),
                suffixButton: SuffixButton.obscureText,
              ),
              TextFieldBlocBuilder(
                key: const ValueKey("confirm_password"),
                textFieldBloc: formBloc.confirmPassword,
                decoration: inputDecoration(label: "confirm_password".tr),
                suffixButton: SuffixButton.obscureText,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                key: const ValueKey("confirm"),
                title: "confirm".tr,
                onTap: () {
                  formBloc.submit();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}