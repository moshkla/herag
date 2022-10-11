import 'package:flutter/material.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/utiles/size_config.dart';

import '../../../theme/app_assets.dart';
import '../../language/pages/language.page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      MagicRouter.navigateAndPopAll(const LanguagePage());
    });
  }  @override
  Widget build(BuildContext context) {
    Si().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.all(Si.ds! * 4),
        child: Center(
          child: Image.asset(AppAssets.logo),
        ),
      ),
    );
  }
}
