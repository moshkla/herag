// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:get/get.dart';
// import 'package:majdia/theme/text_styles.dart';
//
// import '../../../core/routes/routes.dart';
// import '../../../theme/input_decoration.dart';
// import '../../../utils/size_config.dart';
// import '../../../widgets/app_bar.dart';
// import '../../../widgets/custom_button.dart';
// import '../blocs/login_form.bloc.dart';
// import '../widgets/reset_password_widget.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   late LoginFormBloc formBloc;
//
//   @override
//   void initState() {
//     super.initState();
//     formBloc = LoginFormBloc();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: SizeConfig.defaultSize! * 60,
//               child: Stack(
//                 children: [
//                   PositionedDirectional(
//                       child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(SizeConfig.defaultSize!),
//                           bottomRight:
//                               Radius.circular(SizeConfig.defaultSize!)),
//                     ),
//                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                     child: Image.asset(
//                       'assets/images/login_bg.png',
//                       width: Get.width,
//                       height: SizeConfig.defaultSize! * 35,
//                       fit: BoxFit.cover,
//                     ),
//                   )),
//                   PositionedDirectional(
//                       child: Container(
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.white.withOpacity(0.6),
//                             offset: Offset(SizeConfig.defaultSize! * 10, 0),
//                             spreadRadius: 2,
//                             blurRadius: 100),
//                       ],
//                     ),
//                   )),
//                   //Image.asset('assets/images/unit_bg.png',fit: BoxFit.cover,),
//                   pageAppBar(
//                     title: 'login',
//                     color: Colors.black,
//                   ),
//                   PositionedDirectional(
//                       top: SizeConfig.defaultSize! * 4,
//                       start: 0,
//                       child: Image.asset(
//                         'assets/images/slogo.png',
//                         height: SizeConfig.defaultSize! * 15,
//                         color: Colors.black,
//                       )),
//                   PositionedDirectional(
//                       top: SizeConfig.defaultSize! * 18,
//                       start: 20,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'مرحبا بك في \nمجتمع متكامل',
//                             style: context.textTheme.titleLarge!.copyWith(
//                               fontSize: SizeConfig.defaultSize!*2.5,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           ),
//                           VerticalSpace(value: 1),
//                           Text(
//                             'يرجي تسجيل الدخول',
//                             style: context.textTheme.caption!.copyWith(
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.black,
//                             fontSize: SizeConfig.defaultSize!*1.5),
//                           )
//                         ],
//                       )),
//                   PositionedDirectional(
//                     bottom: 0,
//                     start: 0,
//                     end: 0,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Container(
//                         width: Get.width,
//                         decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.circular(SizeConfig.defaultSize!),
//                         ),
//                         child: Card(
//                             elevation: 1,
//                             child: Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: FormBlocListener(
//                                 formBloc: formBloc,
//                                 child: ListView(
//                                   shrinkWrap: true,
//                                   primary: false,
//                                   key: const ValueKey("login_scroll"),
//                                   physics: const NeverScrollableScrollPhysics(),
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16),
//                                   children: [
//                                     TextFieldBlocBuilder(
//                                       key: const Key("email"),
//                                       textFieldBloc: formBloc.email,
//                                       decoration: InputDecoration(
//                                           label: Text("email".tr)),
//                                       keyboardType: TextInputType.emailAddress,
//                                     ),
//                                     TextFieldBlocBuilder(
//                                       key: const Key("password"),
//                                       textFieldBloc: formBloc.password,
//                                       decoration: InputDecoration(
//                                           label: Text("password".tr)),
//                                       suffixButton: SuffixButton.obscureText,
//                                     ),
//                                     Row(
//                                       children: [
//                                         TextButton(
//                                           child: Text(
//                                             "do_you_forget_password".tr,
//                                             style: context.textTheme.titleBold,
//                                           ),
//                                           onPressed: () {
//                                             Get.dialog(const Dialog(
//                                               backgroundColor:
//                                                   Colors.transparent,
//                                               child: ResetPasswordWidget(),
//                                             ));
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                     CustomButton(
//                                       key: const ValueKey("login"),
//                                       title: "login".tr,
//                                       onTap: () {
//                                         formBloc.submit();
//                                       },
//                                     ),
//                                     const SizedBox(
//                                       height: 16,
//                                     ),
//                                     Center(
//                                       key: const ValueKey("register"),
//                                       child: Text.rich(
//                                         TextSpan(
//                                             text: "dont_have_acc!".tr,
//                                             style: context.textTheme.subTitle,
//                                             children: [
//                                               TextSpan(
//                                                   text: "register_now".tr,
//                                                   style: context
//                                                       .textTheme.subTitleBold.copyWith(color: Colors.black),
//                                                   recognizer:
//                                                       TapGestureRecognizer()
//                                                         ..onTap = () {
//                                                           Get.toNamed(
//                                                               Routes.register);
//                                                         })
//                                             ]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
