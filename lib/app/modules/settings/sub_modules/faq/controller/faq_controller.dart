import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/faq/model/faq_model.dart';

class FAQController extends GetxController {
  TextEditingController qustionController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  FaqModel faqModel = FaqModel();
  List<FaqModel> faqList = [
    FaqModel(
      id: 1,
      qustion: "How the price include cleaning?",
      answer:
          "Egestas placerat et nec sed. Amet at tellus nisl risus. Sit purus enim feugiat suspendie morbi duis. Amet vitae ",
    ),
    FaqModel(
      id: 2,
      qustion: "How the price include cleaning?",
      answer:
          "Egestas placerat et nec sed. Amet at tellus nisl risus. Sit purus enim feugiat suspendie morbi duis. Amet vitae ",
    ),
  ];
  addFaq(FaqModel data) {
    faqList.add(data);
    qustionController.clear();
    answerController.clear();
    update();
  }
}
