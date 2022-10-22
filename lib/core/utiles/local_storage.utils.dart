import 'package:get_storage/get_storage.dart';

class LocalStorageUtils {
  Future<void> inits() async => await GetStorage.init();

 static String? get token {
    return GetStorage().read("token");
  }

  static String get locale {
    return GetStorage().read("locale") ?? "ar";
  }

  static bool? get isDarkMode {
    return GetStorage().read("isDarkMode");
  }

  static bool get firstTime {
    return GetStorage().read('firstTime') ?? true;
  }


  static setToken(String? token) async {
    await GetStorage().write("token", token);
  }

  static setLocale(String locale) async {
    await GetStorage().write("locale", locale);
  }

  static setIsDarkMode(bool isDarkMode) async {
    await GetStorage().write("isDarkMode", isDarkMode);
  }

  static setFirstTime(bool firstTime) async {
    await GetStorage().write("firstTime", firstTime);
  }

}
