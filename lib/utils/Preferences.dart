import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static String isLogin = "isLogin";
  static String email = "email";
  static String password = "password";

  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  // call this method from iniState() function of mainApp().

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static Future<bool> setUserEmail(String userEmailId) async {
    var prefs = await _instance;
    return prefs.setString(email, userEmailId);
  }

  static getUserEmail() {
    return _prefsInstance!.getString(email) ?? Future.value(' ');;
  }

  static Future<bool> setIsLogin(bool value) async {
    var prefs = await _instance;
    return prefs.setBool(isLogin, value) ?? Future.value(false);
  }

  static getIsLogin() {
    return _prefsInstance!.getBool(isLogin) ?? false;
  }
}
