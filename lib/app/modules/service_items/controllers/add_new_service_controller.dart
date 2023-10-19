import 'package:get/get.dart';

class AddNewServiceController extends GetxController {
  Rx<AddNewServiceTabEnum> selectedServiceTabEnum = AddNewServiceTabEnum.overview.obs;
}

enum AddNewServiceTabEnum { overview, addSubItems, content }
