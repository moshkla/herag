import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utiles/local_storage.utils.dart';
import '../utiles/size_config.dart';
import 'colors.dart';

const kLogo = 'asset/images/splash.png';
const kLogo2 = 'asset/images/WhatsApp Image 2021-12-19 at 11.53.18 AM.png';
const kBgImage = 'assets/images/splash_bg.png';
const kHomeLayout = '/';

TextStyle headingStyle = TextStyle(
  fontFamily: 'URW DIN Arabic',
  fontSize: Si.ds! * 1.8,
  color: colordeepGrey,
);

//////////////////////////////////////////////////

Widget logoImage() {
  return Center(
    child: Image.asset(kLogo),
  );
}
//////////////////////////////////////////////////

appbarNoTitle() {
  return AppBar(
    toolbarHeight: 0.0,
    elevation: 0.0,
  );
}

//////////////////////////////////////////////////////

Widget loading(context) {
  Si().init(context);
  return Container(
    color: Colors.white,
    child: Center(
      child: Center(
        child: SpinKitPouringHourGlass(
          size: Si.ds! * 10,
          color: kMainColor,
          duration: const Duration(milliseconds: 1000),
        ),
      ),
    ),
  );
}

//////////////////////////////////////////////////////////
late SharedPreferences prefs;
Future startShared() async {
  prefs = await SharedPreferences.getInstance();
}


////////////////////////////////////////////////////////////////

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}

////////////////////////////////////////////////////////////////
