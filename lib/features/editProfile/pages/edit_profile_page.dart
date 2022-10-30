import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';

import 'package:herag/features/auth/blocs/auth.cubit.dart';
import 'package:herag/theme/input_decoration.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/page_app_bar.dart';
import '../../../functions/cashed_network_image.dart';
import '../../../theme/app_colors.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);
  var authBloc = GetIt.I<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            pageAppBar(pageTitle: 'تعديل الملف الشخصي'),
            VerticalSpace(value: 3),
            Container(
              height: 130,
              width: 130,
              // padding: EdgeInsets.all(),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(
                    Si.ds! * 10,
                  )),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: customCachedNetworkImage(
                  url: authBloc.state.profileModel?.body?.user?.image ?? '',
                  context: context,
                  fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  VerticalSpace(value: 2),
                  TextFormField(
                    style: TextStyle(fontSize: Si.ds! * 2.5),
                    decoration: inputDecoration(label: 'name'.tr()),
                  ),
                  VerticalSpace(value: 2),
                  TextFormField(
                    style: TextStyle(fontSize: Si.ds! * 2.5),
                    decoration: inputDecoration(label: 'email'.tr()),
                  ),
                  VerticalSpace(value: 2),
                  TextFormField(
                    style: TextStyle(fontSize: Si.ds! * 2.5),
                    decoration: inputDecoration(label: 'phone'.tr()),
                  ),
                  VerticalSpace(value: 2),
                  CustomGeneralButton(
                    text: 'save'.tr(),
                    onTap: () {},
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
