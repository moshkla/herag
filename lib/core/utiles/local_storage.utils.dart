
import '../constants/constants.dart';

class LocalStorageUtils {
  // Future<void> inits() async => await GetStorage.init();

// final box = GetStorage();
  static String? get token {
    return prefs.getString("token") ?? null;
  }

  static String get locale {
    return prefs.getString("locale") ?? "ar";
  }

  static bool? get isDarkMode {
    return prefs.getBool("isDarkMode");
  }

  static bool get firstTime {
    return prefs.getBool('firstTime') ?? true;
  }

  static get userType {
    return prefs.get('userType') ?? "CUSTOMER";
  }

  static setToken(String? token) async {
    await prefs.setString("token", token!);
  }

  // static setLocale(String locale) async {
  //   await GetStorage().write("locale", locale);
  // }

  static setIsDarkMode(bool isDarkMode) async {
    await prefs.setBool("isDarkMode", isDarkMode);
  }

  static setFirstTime(bool firstTime) async {
    await prefs.setBool("firstTime", firstTime);
  }

  static setUerType(String userType) async {
    await prefs.setString("userType", userType);
  }
}