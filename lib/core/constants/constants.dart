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

/////////////////////////////////////////////////

late SharedPreferences prefs;
Future startShared() async {
  prefs = await SharedPreferences.getInstance();
}

//////////////////////////////////////////////////////////

String translateString(String arabic, String english) {
  return LocalStorageUtils.locale == 'ar' ? arabic : english;
  // return prefs.getString("lang")=='en'?a:b;
}

////////////////////////////////////////////////////////////////

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}

////////////////////////////////////////////////////////////////
List<String> month = [
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
];
List<String> day = [
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24",
  "25",
  "26",
  "27",
  "28",
  "29",
  "30",
];

List<String> yaer = [
  "1980",
  "1981",
  "1982",
  "1983",
  "1984",
  "1985",
  "1986",
  "1987",
  "1988",
  "1989",
  "1990",
  "1991",
  "1992",
  "1993",
  "1994",
  "1995",
  "1996",
  "1997",
  "1998",
  "1999",
  "2000",
];

List<String> hours = [
  "00:00:00",
  "01:00:00",
  "02:00:00",
  "03:00:00",
  "04:00:00",
  "05:00:00",
  "06:00:00",
  "07:00:00",
  "08:00:00",
  "09:00:00",
  "10:00:00",
  "11:00:00",
  "12:00:00",
  "13:00:00",
  "14:00:00",
  "15:00:00",
  "16:00:00",
  "17:00:00",
  "18:00:00",
  "19:00:00",
  "20:00:00",
  "21:00:00",
  "22:00:00",
  "23:00:00",
  "24:00:00",
];

List<String> daysApi = [
  "Saturday",
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday"
];

List<String> days = [
  "السبت",
  "الاحد",
  "الاثنين",
  "الثلاثاء",
  "الاربعاء",
  "الخميس",
  "الجمعة"
];
