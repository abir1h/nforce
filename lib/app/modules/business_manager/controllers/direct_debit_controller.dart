import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DirectDebitController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController swiftCodeController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController routingNoController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String? selectStatus = 'Active';
  List<String> statusList = ['Active', 'Inactive'];

  void setStatus(String value) {
    selectStatus = value;
    update();
  }
}
