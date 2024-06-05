// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends GetxService {
  static SharedPreferenceService to = Get.find();
  static const String TOKEN = "token";
  static const String UNIQUE_ID = "unique-id";
  static const String USER_EMAIL = "user-email";
  static const String DEVICE_TOKEN = "device-token";
  static const String USER_ID = "user-id";
  static late SharedPreferences _sharedPreferences;

  Future<SharedPreferenceService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  static String? getAppLanguage() {
    return _sharedPreferences.getString("appLanguage");
  }

  static void setAppLanguage(String language) {
    _sharedPreferences.setString("appLanguage", language);
  }

  static String? getToken() {
    return _sharedPreferences.getString(TOKEN);
  }

  static void setToken(String token) {
    _sharedPreferences.setString(TOKEN, token);
  }

  static void setUserId(int userId) {
    _sharedPreferences.setInt(USER_ID, userId);
  }

  static int? getUserId() {
    return _sharedPreferences.getInt(USER_ID);
  }

  static void setUniqueId(String userHash) {
    _sharedPreferences.setString(UNIQUE_ID, userHash);
  }

  static String? getUniqueId() {
    return _sharedPreferences.getString(UNIQUE_ID);
  }

  static Future<void> clear() async {
    await _sharedPreferences.clear();
    return;
  }
}
