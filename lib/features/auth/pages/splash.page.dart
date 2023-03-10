import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/utiles/size_config.dart';

import '../../../business logic/appCubit/appcubit_cubit.dart';
import '../../../core/utiles/local_storage.utils.dart';
import '../../../layout/layout.page.dart';
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
    GetIt.I<AppCubit>().getPosts(categoryId: 0);
    GetIt.I<AppCubit>().getHome();
    GetIt.I<AppCubit>().getConstants();
    GetIt.I<AppCubit>().getFaqs();
    Future.delayed(const Duration(seconds: 2), () {
      MagicRouter.navigateAndPopAll(
          const LanguagePage()
         // LocalStorageUtils.token == null ? LanguagePage() : LayoutPage()
          );
    });
  }

  @override
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
