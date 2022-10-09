import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/text_styles.dart';

import '../../../theme/input_decoration.dart';
import '../../../widgets/custom_button.dart';
import '../blocs/change_password_form_bloc.dart';

class ChangePasswordWidget extends StatelessWidget {
  ChangePasswordFormBloc changePasswordFormBloc = ChangePasswordFormBloc();

  ChangePasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(2)),
      child: FormBlocListener(
        formBloc: changePasswordFormBloc,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "change_password".tr,
                style: context.textTheme.titleBold,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFieldBlocBuilder(
                key: const ValueKey("password"),
                textFieldBloc: changePasswordFormBloc.password,
                decoration: inputDecoration(label: "password".tr),
                suffixButton: SuffixButton.obscureText,
              ),
              TextFieldBlocBuilder(
                key: const ValueKey("confirm_password"),
                textFieldBloc: changePasswordFormBloc.confirmPassword,
                decoration: inputDecoration(label: "confirm_password".tr),
                suffixButton: SuffixButton.obscureText,
              ),
              const SizedBox(
                height: 16,
              ),
              // CustomButton(
              //   key: const ValueKey("confirm"),
              //   title: "confirm".tr,
              //   onTap: () {
              //     changePasswordFormBloc.submit();
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
