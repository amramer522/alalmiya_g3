import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> clear() async {
    await _prefs.clear();
    await setNotFirstTime();
  }

  static bool get isFirstTime {
    return _prefs.getBool("isFirstTime") ?? true;
  }

  static bool get isAuth {
    return _prefs.getBool("isAuth") ?? false;
  }

  static Future<void> setFCMToken(String token) async {
    await _prefs.setString('fcmToken', token);
  }

  static Future<void> setUserToken(String token) async {
    await _prefs.setString('userToken', token);
  }
  static String get getUserToken
  {
    return _prefs.getString("userToken") ?? "dadad";
  }

  static String get getFCMToken
  {
    return _prefs.getString("fcmToken") ?? "dadad";
  }


  static String get name {
    return _prefs.getString("name") ?? "Visitor";
  }

  static String get image {
    return _prefs.getString("image") ?? "";
  }

  static String get email {
    return _prefs.getString("email") ?? "example@gmail.com";
  }

  static String get password {
    return _prefs.getString("password") ?? "*********";
  }

  static Future<void> setNotFirstTime() async {
    await _prefs.setBool('isFirstTime', false);
  }

  static Future<void> saveUserData({required String email, required String password}) async {
    await _prefs.setBool('isAuth', true);
    await _prefs.setString('email', email);
    await _prefs.setString('password', password);
    await _prefs.setString('name', "Amr Bakr");
    await _prefs.setString(
        'image', "https://media.licdn.com/dms/image/D4D03AQFHszHTeYFKvw/profile-displayphoto-shrink_800_800/0/1663237154241?e=1704931200&v=beta&t=OgJOo9cyBXbL9NbdLoa9uhPgseTrUel1muDJUwj2KeE");
  }
}
