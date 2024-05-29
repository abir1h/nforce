import 'package:get/get.dart';
import 'package:nuforce/app/model/user_card_model.dart';

class AppState extends GetxController {
  UserCard? user;

  void setUser(UserCard user) {
    this.user = user;
    update();
  }
}
