import 'package:get_storage/get_storage.dart';

class LocalStorageUtils {
  Future<void> inits() async => await GetStorage.init();

  String? get token {
    return GetStorage().read("token");
  }

  String get locale {
    return GetStorage().read("locale") ?? "ar";
  }

  bool? get isDarkMode {
    return GetStorage().read("isDarkMode");
  }

  bool get firstTime {
    return GetStorage().read('firstTime') ?? true;
  }


  setToken(String? token) async {
    await GetStorage().write("token", token);
  }

  setLocale(String locale) async {
    await GetStorage().write("locale", locale);
  }

  setIsDarkMode(bool isDarkMode) async {
    await GetStorage().write("isDarkMode", isDarkMode);
  }

  setFirstTime(bool firstTime) async {
    await GetStorage().write("firstTime", firstTime);
  }

}
