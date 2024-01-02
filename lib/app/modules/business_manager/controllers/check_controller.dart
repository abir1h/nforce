import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController printCheckController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String? selectStatus = 'Active';
  List<String> statusList = ['Active', 'Inactive'];

  void setStatus(String value) {
    selectStatus = value;
    update();
  }
}
