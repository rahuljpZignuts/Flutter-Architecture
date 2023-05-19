import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static const _accessToken = "access-token";

  static getSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences preferences = await getSharedPreferences();
    preferences.setString(_accessToken, token);
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await getSharedPreferences();
    return preferences.getString(_accessToken) ?? "";
  }
}
