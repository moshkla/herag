import 'package:flutter/material.dart';
import 'package:herag/core/constants/colors.dart';
import 'package:herag/core/constants/constants.dart';

import '../../theme/app_colors.dart';
import '../utiles/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.isPassword,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.onEditingComplete,
    this.maxLines,
    required this.label,
    this.controller,
    this.suffix,
    this.suffixPressed,
    this.prefix,
    this.hint,
    this.validator,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final FocusNode? focusNode;
  final int? maxLines;
  final String label;
  final String? hint;
  final bool? isPassword;
  final IconData? suffix;
  final IconData? prefix;
  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final VoidCallback? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      onEditingComplete: onEditingComplete,
      cursorColor: kMainColor,
      decoration: InputDecoration(
        // labelStyle: headingStyle.copyWith(color: kMainColor),
        hintText: hint,
        hintStyle: headingStyle.copyWith(color: colorLightGrey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Si.ds!*1.5),
          borderSide: const BorderSide(color:AppColors.primary),
        ),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        labelText: label,
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Si.ds!*1.5),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

class CustomTextFormFieldEditProfile extends StatelessWidget {
  const CustomTextFormFieldEditProfile({
    Key? key,
    this.isPassword,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.onEditingComplete,
    this.maxLines,
    required this.label,
    this.controller,
    this.suffix,
    this.suffixPressed,
    this.prefix,
    required this.hint,
    this.validator,
  }) : super(key: key);
  final TextEditingController? controller;

  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final FocusNode? focusNode;
  final int? maxLines;
  final String label;
  final String hint;
  final bool? isPassword;
  final String? suffix;
  final IconData? prefix;

  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final Function? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      onEditingComplete: onEditingComplete,
      cursorColor: kMainColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: headingStyle.copyWith(color: colorLightGrey),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colorWhite_3)),
        suffixIcon: suffix != null
            ? InkWell(
                onTap: () {
                  suffixPressed!();
                },
                child: Image.asset(
                  suffix!,
                  color: kMainColor,
                ))
            : null,
        // labelText: label,
        filled: true,
        fillColor: colorWhite_3,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colorWhite_3)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colorWhite_3)),
      ),
    );
  }
}
