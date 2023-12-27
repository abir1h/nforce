import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/models/user_info.dart';

class SettingsController extends GetxController {

   UserInfo? userInfo;
   TextEditingController firstName = TextEditingController();
   TextEditingController lastName = TextEditingController();
   TextEditingController email = TextEditingController();
   TextEditingController phoneNumber = TextEditingController();
   TextEditingController businessName = TextEditingController();
   TextEditingController businessDomain = TextEditingController();
   TextEditingController address = TextEditingController();
   TextEditingController contactUs = TextEditingController();
   TextEditingController helpEmail = TextEditingController();
   save(UserInfo data){
     userInfo=data;
     update();
   }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
