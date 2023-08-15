// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends GetxService {
  static SharedPreferenceService to = Get.find();
  static const String TOKEN = "token";
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

  static Future<void> clear() async {
    await _sharedPreferences.clear();
    return;
  }
}
