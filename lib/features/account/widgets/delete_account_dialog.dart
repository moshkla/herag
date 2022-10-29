import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../core/router/router.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/custom_buttons_widget.dart';
import '../../auth/blocs/auth.cubit.dart';

class DialogDeleteAccount extends StatelessWidget {
  const DialogDeleteAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Si.ds! * 15,
        //  margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: SizedBox.expand(
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.circular(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const VerticalSpace(value: 1.5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "del_acc_message".tr(),
                      style: TextStyle(
                          fontSize: Si.ds! * 2, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: Si.ds! * 4,
                            width: Si.ds! * 11,
                            child: CustomGeneralButton(
                                color: Colors.red,
                                text: "confirm".tr(),
                                onTap: () {
                                  GetIt.I<AuthCubit>().deleteAccount();
                                })),
                        const HorizontalSpace(value: 3),
                        SizedBox(
                            height: Si.ds! * 4,
                            width: Si.ds! * 11,
                            child: CustomGeneralButton(
                                color: Colors.green,
                                text: 'cancel'.tr(),
                                onTap: () {
                                  MagicRouter.pop();
                                })),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
