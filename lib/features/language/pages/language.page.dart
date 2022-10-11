import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';

import '../../../theme/app_assets.dart';
import '../../../theme/styles.dart';
import '../../../theme/text_styles.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    Si().init(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: Si.ds! * 5, end: Si.ds! * 5, top: Si.ds! * 6),
              child: Center(
                child: Image.asset(AppAssets.logo),
              ),
            ),
            Padding(
              padding: edgeInsetsSymmetric(h: 2, v: 5),
              child: Container(
                padding: edgeInsetsSymmetric(h: 2, v: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Si.ds!),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      translateString('اللغة', 'Language'),
                      style: title,
                    ),
                    VerticalSpace(value: 2),
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
                            });
                          }),
                    ),
                    VerticalSpace(value: 1),
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
                            });
                          }),
                    ),
                    VerticalSpace(value: 2),
                    CustomGeneralButton(
                        text: translateString('التالي', 'Next'), onTap: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
