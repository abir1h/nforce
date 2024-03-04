import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';

class InvoiceController extends GetxController {
  XFile? _image;
  XFile? get image => _image;
  Future<void> setImage() async {
    // as for permision
    _image = await pickImage(ImageSource.gallery);
    update();
  }
}
