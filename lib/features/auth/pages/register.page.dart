// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:get/get.dart';
// import 'package:majdia/features/auth/blocs/auth.controller.dart';
// import 'package:majdia/theme/text_styles.dart';
// import '../../../core/routes/routes.dart';
// import '../../../theme/input_decoration.dart';
// import '../../../widgets/app_bar.dart';
// import '../../../widgets/custom_button.dart';
// import '../blocs/register_form_bloc.dart';
//
// class RegisterPage extends GetView<AuthController> {
//   RegisterPage({Key? key}) : super(key: key);
//
//   late RegisterFormBloc formBloc;
//   bool saudiaSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: pageAppBar(title: "register".tr),
//       body: GetBuilder<AuthController>(
//         initState: (_) {
//           formBloc = RegisterFormBloc();
//         },
//         builder: (c) {
//           return FormBlocListener(
//             formBloc: formBloc,
//             child: ListView(
//               physics: const ClampingScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//               children: [
//                 pageAppBar(
//                   title: "register",
//                   color: Colors.black,
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 TextFieldBlocBuilder(
//                   cursorColor: Colors.black,
//                   key: const ValueKey("name"),
//                   textFieldBloc: formBloc.name,
//                   decoration: InputDecoration(
//                     label: Text("name".tr),
//                   ),
//                 ),
//                 TextFieldBlocBuilder(
//                   cursorColor: Colors.black,
//                   key: const ValueKey("email"),
//                   textFieldBloc: formBloc.email,
//                   decoration: InputDecoration(label: Text("email".tr)),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 TextFieldBlocBuilder(
//                   cursorColor: Colors.black,
//                   key: const ValueKey("phone"),
//                   textFieldBloc: formBloc.phone,
//                   decoration: InputDecoration(label: Text("phone".tr)),
//                 ),
//                 TextFieldBlocBuilder(
//                   cursorColor: Colors.black,
//                   key: const ValueKey("password"),
//                   textFieldBloc: formBloc.password,
//                   decoration: InputDecoration(label: Text("password".tr)),
//                   suffixButton: SuffixButton.obscureText,
//                 ),
//                 TextFieldBlocBuilder(
//                   cursorColor: Colors.black,
//                   key: const ValueKey("confirm_password"),
//                   textFieldBloc: formBloc.confirmPassword,
//                   decoration:
//                       InputDecoration(label: Text("confirm_password".tr)),
//                   suffixButton: SuffixButton.obscureText,
//                 ),
//                 TextFieldBlocBuilder(
//                   cursorColor: Colors.black,
//                   key: const ValueKey("national id"),
//                   textFieldBloc: formBloc.nationalId,
//                   decoration: InputDecoration(
//                     label: Text("identification_num".tr),
//                   ),
//                 ),
//                 DateTimeFieldBlocBuilder(
//                   dateTimeFieldBloc: formBloc.dateOfBirth,
//                   format: DateFormat("yyyy-MM-dd"),
//                   initialDate: DateTime(1970, 1, 1),
//                   firstDate: DateTime(1900),
//                   lastDate: DateTime.now(),
//                   decoration: InputDecoration(
//                     label: Text("birth_date".tr),
//                     icon: Icon(Icons.calendar_today),
//                   ),
//                 ),
//                 DropdownFieldBlocBuilder<String>(
//                   key: const ValueKey("gender"),
//                   selectFieldBloc: formBloc.gender,
//                   showEmptyItem: false,
//                   decoration: InputDecoration(
//                     label: Text('gender'.tr),
//                   ),
//                   itemBuilder: (context, value) => FieldItem(
//                     child: Text(value),
//                   ),
//                 ),
//                 DropdownFieldBlocBuilder<String>(
//                   onChanged: (value) {
//                     if (value == 'السعودية') {
//                       saudiaSelected = true;
//                       controller.update();
//                     } else {
//                       saudiaSelected = false;
//                       controller.update();
//                     }
//                   },
//                   key: const ValueKey("country"),
//                   selectFieldBloc: formBloc.country,
//                   showEmptyItem: false,
//                   decoration: InputDecoration(
//                     label: Text('country'.tr),
//                   ),
//                   itemBuilder: (context, country) => FieldItem(
//                     child: Text(country),
//                   ),
//                 ),
//                 if (saudiaSelected)
//                   DropdownFieldBlocBuilder<String>(
//                     key: const ValueKey("city"),
//                     showEmptyItem: false,
//                     selectFieldBloc: formBloc.city,
//                     decoration: InputDecoration(
//                       label: Text('city'.tr),
//                     ),
//                     itemBuilder: (context, city) => FieldItem(
//                       child: Text(city),
//                     ),
//                   ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 CustomButton(
//                   key: const ValueKey("confirm"),
//                   title: "register".tr,
//                   onTap: () {
//                     formBloc.submit();
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Center(
//                   child: Text.rich(
//                     TextSpan(
//                         text: "already_have_acc!".tr,
//                         style: context.textTheme.subTitle,
//                         children: [
//                           TextSpan(
//                               text: "login".tr,
//                               style: context.textTheme.subTitleBold
//                                   .copyWith(color: context.theme.primaryColor),
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   Get.toNamed(Routes.login);
//                                 })
//                         ]),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
