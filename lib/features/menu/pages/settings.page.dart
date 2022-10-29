import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:herag/core/widgets/page_app_bar.dart';
import '../../../core/utiles/size_config.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/styles.dart';
import '../../../theme/text_styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          pageAppBar(pageTitle: 'settings'.tr()),
          Container(
            padding: edgeInsetsSymmetric(h: 2, v: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Si.ds!),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(
                  'language'.tr(),
                  style: title,
                ),
                const VerticalSpace(value: 2),
                Container(
                  decoration: boxDecoration(withBorder: true),
                  child: RadioListTile(
                      value: 0,
                      title: Text(
                        'اللغة العربية',
                        style: titleSmall,
                      ),
                      groupValue: selectedIndex,
                      onChanged: (int? value) {
                        setState(() {
                          selectedIndex = value;
                          context.setLocale(const Locale("ar"));
                        });
                      }),
                ),
                const VerticalSpace(value: 1),
                Container(
                  decoration: boxDecoration(withBorder: true),
                  child: RadioListTile(
                      value: 1,
                      title: Text(
                        'English Language',
                        style: titleSmall,
                      ),
                      groupValue: selectedIndex,
                      onChanged: (int? value) {
                        setState(() {
                          selectedIndex = value;
                          context.setLocale(const Locale("en"));
                        });
                      }),
                ),
                const VerticalSpace(value: 2),
                // CustomGeneralButton(
                //     text: 'next'.tr(), onTap: () {
                //   MagicRouter.navigateAndPopAll(const LoginPage());
                // }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
