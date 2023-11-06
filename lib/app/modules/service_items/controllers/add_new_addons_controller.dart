import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddNewAddonsController extends GetxController {
  RxList<XFile?>? selectedImages = <XFile?>[].obs;

  void addToSelectedImages(XFile image) {
    selectedImages!.add(image);
  }
}

enum AddNewServiceTabEnum { overview, addSubItems, content }
