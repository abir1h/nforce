import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddonController extends GetxController {
  RxList<dynamic> featureList = <dynamic>[
    'Another service policy',
    'Notice of Cancellation',
  ].obs;
  RxList<dynamic> imageList = <dynamic>[].obs;
  TextEditingController featureController=TextEditingController();
  FocusNode focusNode=FocusNode();
  void addFeature(String value){
    featureList.add(value);
    featureController.clear();
  }
  void removeFeature(String value){
    featureList.remove(value);
  }
}
