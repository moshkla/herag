import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/constants.dart';
import 'dependancy_injection.dart' as di;

class AppBindings {
  static Future initAsyncDependebcies() async {
   WidgetsFlutterBinding.ensureInitialized();
    await di.init();
   // await GetStorage.init();
   await startShared();
    await EasyLocalization.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarIconBrightness: Brightness.dark,
    //   statusBarBrightness: Brightness.dark,
    // ));
  }
}
