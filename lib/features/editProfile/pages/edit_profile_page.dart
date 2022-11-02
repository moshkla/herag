import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';

import 'package:herag/features/auth/blocs/auth.cubit.dart';
import 'package:herag/theme/input_decoration.dart';
import '../../../business logic/appCubit/appcubit_cubit.dart';
import '../../../core/utiles/file.utils.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/page_app_bar.dart';
import '../../../functions/cashed_network_image.dart';
import '../../../theme/app_colors.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var authBloc = GetIt.I<AuthCubit>();
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var image;
  var bloc = GetIt.I<AppCubit>();

  @override
  void initState() {
    super.initState();
    name.text = authBloc.state.profileModel?.body?.user?.name ?? '';
    email.text = authBloc.state.profileModel?.body?.user?.email ?? '';
    phone.text = authBloc.state.profileModel?.body?.user?.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            pageAppBar(pageTitle: 'تعديل الملف الشخصي'),
            VerticalSpace(value: 3),
            InkWell(
              onTap: () async {
                await FileUtils.pickImage().then((value) async {
                  image = File(value!.path.toString());
                  bloc.pickedImage = value;
                  return null;
                });
                setState(() {});
              },
              child: Container(
                height: 130,
                width: 130,
                // padding: EdgeInsets.all(),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(
                      Si.ds! * 10,
                    )),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: image == null
                    ? customCachedNetworkImage(
                        url: authBloc.state.profileModel?.body?.user?.image ??
                            '',
                        context: context,
                        fit: BoxFit.cover)
                    : Image.file(
                        image,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  VerticalSpace(value: 2),
                  TextFormField(
                    controller: name,
                    style: TextStyle(fontSize: Si.ds! * 2.5),
                    decoration: inputDecoration(label: 'name'.tr()),
                  ),
                  VerticalSpace(value: 2),
                  TextFormField(
                    controller: email,
                    style: TextStyle(fontSize: Si.ds! * 2.5),
                    decoration: inputDecoration(label: 'email'.tr()),
                  ),
                  VerticalSpace(value: 2),
                  TextFormField(
                    controller: phone,
                    style: TextStyle(fontSize: Si.ds! * 2.5),
                    decoration: inputDecoration(label: 'phone'.tr()),
                  ),
                  VerticalSpace(value: 2),
                  CustomGeneralButton(
                    text: 'save'.tr(),
                    onTap: () {
                      bloc.editProfile(
                          name: name.text,
                          email: email.text,
                          phone: phone.text);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
