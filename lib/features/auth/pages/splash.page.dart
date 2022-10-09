import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/theme/app_assets.dart';

import '../blocs/auth.controller.dart';

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
      Get.find<AuthController>().initAccount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          AppAssets.logo,
          width: Get.width / 1.5,
        ),
      ),
    );
  }
}
