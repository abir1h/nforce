import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomFieldController extends GetxController {
/*
  Rx<CustomFieldTabEnum> miniTabEnum = CustomFieldTabEnum..obs;
*/


  @override
  void dispose() {
    super.dispose();
  }
}
enum CustomFieldTabEnum { customer , agent, service, project, preorderfield, all, }
