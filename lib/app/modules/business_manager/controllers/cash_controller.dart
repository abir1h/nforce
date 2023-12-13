import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CashController extends GetxController {

 TextEditingController nameController=TextEditingController();
 TextEditingController noteController=TextEditingController();
 String? selectStatus = "Active";
 List statusList = ["Active", "Inactive"];

 void setStatus(String value) {
  selectStatus = value;
  update();
 }

 @override
  void dispose() {
    super.dispose();
  }
}
