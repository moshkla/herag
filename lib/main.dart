import 'package:api_request/api_request.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/translations/codegen_loader.g.dart';
import 'core/app_binding.dart';
import 'core/router/router.dart';
import 'core/utiles/bloc_observer.dart';
import 'core/utiles/local_storage.utils.dart';
import 'features/auth/pages/splash.page.dart';
import 'theme/themes.dart';

void main() async {
  await AppBindings.initAsyncDependebcies();
  ApiRequestOptions.instance?.config(
    baseUrl: 'https://jadeerlaw.com/',
    tokenType: ApiRequestOptions.bearer,
    getToken: () => GetIt.I<LocalStorageUtils>().token,
    enableLog: true,
  );

  BlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        supportedLocales: const [Locale('ar', ''), Locale('en', '')],
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Herag',
      theme: Themes.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale('ar', ''),
      home: const SplashPage(),
    );
  }
}
