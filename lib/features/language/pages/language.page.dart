import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/utiles/size_config.dart';

import '../../../theme/app_assets.dart';
import '../../../theme/text_styles.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
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
              padding: EdgeInsets.all(Si.ds! * 4),
              child: Center(
                child: Image.asset(AppAssets.logo),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Si.ds!),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Si.ds!),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: Si.ds!),
                child: Column(
                  children: [
                    Text(
                      translateString('اللغة', 'Language'),
                      style: title,
                    ),
                    RadioListTile(value: 0, groupValue: 1, onChanged: (value) {}),
                    RadioListTile(value: 0, groupValue: 1, onChanged: (value) {}),
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
