// import 'package:flutter/material.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:get/get.dart';
// import 'package:majdia/core/models/name_with_int_id_model.dart';
//
// import '../../../theme/app_colors.dart';
// import '../../../theme/input_decoration.dart';
// import '../../../utils/size_config.dart';
// import '../../../widgets/app_bar.dart';
// import '../../../widgets/custom_button.dart';
// import '../blocs/edit_profile_form_bloc.dart';
// import 'package:flutter_svg/svg.dart';
//
// class EditeProfilePage extends StatefulWidget {
//   const EditeProfilePage({Key? key}) : super(key: key);
//
//   @override
//   State<EditeProfilePage> createState() => _EditeProfilePageState();
// }
//
// class _EditeProfilePageState extends State<EditeProfilePage> {
//   late EditFormBloc formBloc;
//   bool saudiaSelected = false;
//
//   @override
//   void initState() {
//     super.initState();
//     formBloc = EditFormBloc();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.zero,
//               height: Si.ds! * 30,
//               width: Get.width,
//               child: Stack(
//                 children: [
//                   PositionedDirectional(
//                       child: Container(
//                     width: Get.width,
//                     height: Si.ds! * 20,
//                     decoration: BoxDecoration(
//                       color: AppColors.secondary,
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(Si.ds!),
//                           bottomRight:
//                               Radius.circular(Si.ds!)),
//                     ),
//                   )),
//                   PositionedDirectional(
//                       end: 0,
//                       child: Image.asset(
//                         'assets/images/accbg.png',
//                         width: Si.ds! * 20,
//                         height: Si.ds! * 30,
//                         fit: BoxFit.cover,
//                       )),
//                   // appBar: pageAppBar(title: "profile".tr, showOptions: true),
//
//                   PositionedDirectional(
//                     top: 15,
//                     start: 20,
//                     end: 20,
//                     child: pageAppBar(
//                       title: "profile".tr,
//                       actions: IconButton(
//                         icon: Icon(
//                           Icons.settings,
//                           color: Colors.white,
//                         ),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ),
//                   PositionedDirectional(
//                     bottom: 0,
//                     start: 0,
//                     end: 0,
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           radius:Si.ds!*5.2,
//                           backgroundColor: Colors.white,
//                           child: CircleAvatar(
//                             backgroundColor: AppColors.secondary,
//                             radius: Si.ds!*5,
//                             child: SvgPicture.asset(
//                                 'assets/images/profile-circle-bold.svg',height: Si.ds!*8,color: Colors.white,),
//                           ),
//                         ),
//                         VerticalSpace(value: 1),
//                         Text(
//                           'إبراهيم الزيني',
//                           style: context.textTheme.titleLarge,
//                         ),
//                         VerticalSpace(value: 1),
//                         Text('anasabdelazim602@gmail.com'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               child: FormBlocListener(
//                 formBloc: formBloc,
//                 child: ListView(
//                   shrinkWrap: true,
//                   primary: false,
//                   physics: const NeverScrollableScrollPhysics(),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                   children: [
//                     const SizedBox(
//                       height: 12,
//                     ),
//                     Text(
//                       "name".tr,
//                       style: context.textTheme.titleMedium!
//                           .copyWith(color: Colors.black),
//                     ),
//                     TextFieldBlocBuilder(
//                         key: const ValueKey("name"),
//                         textFieldBloc: formBloc.name,
//                         decoration: InputDecoration()),
//                     Text(
//                       "email".tr,
//                       style: context.textTheme.titleMedium!
//                           .copyWith(color: Colors.black),
//                     ),
//                     TextFieldBlocBuilder(
//                       key: const ValueKey("email"),
//                       textFieldBloc: formBloc.email,
//                       decoration: InputDecoration(),
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     Text(
//                       "phone".tr,
//                       style: context.textTheme.titleMedium!
//                           .copyWith(color: Colors.black),
//                     ),
//                     TextFieldBlocBuilder(
//                       key: const ValueKey("phone"),
//                       textFieldBloc: formBloc.phone,
//                       decoration: InputDecoration(),
//                     ),
//                     Text(
//                       "national_id".tr,
//                       style: context.textTheme.titleMedium!
//                           .copyWith(color: Colors.black),
//                     ),
//                     TextFieldBlocBuilder(
//                       key: const ValueKey("national id"),
//                       textFieldBloc: formBloc.nationalId,
//                       decoration: InputDecoration(),
//                     ),
//                     Text(
//                       "birth_date".tr,
//                       style: context.textTheme.titleMedium!
//                           .copyWith(color: Colors.black),
//                     ),
//                     DateTimeFieldBlocBuilder(
//                       dateTimeFieldBloc: formBloc.dateOfBirth,
//                       format: DateFormat("yyyy-MM-dd"),
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime(2100),
//                       decoration: InputDecoration(
//                         icon: Icon(Icons.calendar_today),
//                         //  color: context.theme.scaffoldBackgroundColor
//                       ),
//                     ),
//                     Text(
//                       'gender'.tr,
//                       style: context.textTheme.titleMedium!
//                           .copyWith(color: Colors.black),
//                     ),
//                     DropdownFieldBlocBuilder<String>(
//                       key: const ValueKey("gender"),
//                       selectFieldBloc: formBloc.gender,
//                       showEmptyItem: false,
//                       decoration: InputDecoration(),
//                       itemBuilder: (context, value) => FieldItem(
//                         child: Text(value),
//                       ),
//                     ),
//                     Text(
//                       'country'.tr,
//                       style: context.textTheme.titleMedium!
//                           .copyWith(color: Colors.black),
//                     ),
//                     DropdownFieldBlocBuilder<NameWithIntId>(
//                       key: const ValueKey("country"),
//                       selectFieldBloc: formBloc.country,
//                       showEmptyItem: false,
//                       decoration: InputDecoration(),
//                       itemBuilder: (context, country) => FieldItem(
//                         child: Text(country.name!),
//                       ),
//                     ),
//                     Text(
//                       'city'.tr,
//                       style: context.textTheme.titleMedium!
//                           .copyWith(color: Colors.black),
//                     ),
//                     DropdownFieldBlocBuilder<NameWithIntId>(
//                       key: const ValueKey("city"),
//                       showEmptyItem: false,
//                       selectFieldBloc: formBloc.city,
//                       decoration: InputDecoration(),
//                       itemBuilder: (context, city) => FieldItem(
//                         child: Text(city.name!),
//                       ),
//                     ),
//                     VerticalSpace(value: 2),
//                     CustomButton(
//                       key: const ValueKey("confirm"),
//                       title: "save".tr,
//                       onTap: () {
//                         formBloc.onSubmitting();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
