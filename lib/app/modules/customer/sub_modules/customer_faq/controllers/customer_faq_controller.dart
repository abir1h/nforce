import 'package:get/get.dart';

import '../../../../settings/sub_modules/faq/model/faq_model.dart';

class CustomerFaqController extends GetxController {
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
}
