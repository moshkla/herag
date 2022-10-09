import 'package:flutter/material.dart';

class AppColors {
  //same on dark
  static const Color primary = Colors.black;

  static const Color secondary = Color(0xffaa8d4d);

  static const Color third = Color(0xffE6D5B9);

  static const Color textLight = Colors.blueGrey;
  static const Color textDark = Colors.white;

  static const Color backgroundLight = Colors.white;
  static Color backgroundDark = Colors.grey;

  static const Color success = Color(0xff365902);
  static const Color failure = Color(0xffE41E3F);
  static Color extFieldBorder = HexColor.fromHex("#BFBDBD");
  static Color colorLightGrey = HexColor.fromHex('#D9D7D7');
  static Color colordeepGrey = HexColor.fromHex('#3C3C3B');

}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}