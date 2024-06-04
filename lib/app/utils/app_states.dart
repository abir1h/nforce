import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/user_card_model.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'dart:developer' as developer show log;

import 'package:nuforce/app/utils/shared_preferences.dart';

class AppState extends GetxController {
  UserCard? user;

  void setUser(UserCard user) {
    developer.log('Current User: ${this.user?.toJson()}', name: 'AppState');
    developer.log('Update current User: ${user.toJson()}', name: 'AppState');
    this.user = user;
    update();
  }

  void logout() {
    SharedPreferenceService.clear();
    Get.deleteAll(force: true);
    Get.offAllNamed<void>(Routes.AUTH);
    Fluttertoast.showToast(msg: 'Logged out');
  }
}
