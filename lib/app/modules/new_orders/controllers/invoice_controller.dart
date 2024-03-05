import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';

class InvoiceController extends GetxController {
  XFile? _image;
  XFile? get image => _image;
  Future<void> setImage() async {
    _image = await pickImage(ImageSource.gallery);
    update();
  }

  DateTime? _invDate;
  DateTime? get invDate => _invDate;
  void updateInvDate(DateTime? date) {
    _invDate = date;
    update();
  }

  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  void updateExpireDate(DateTime? date) {
    _expireDate = date;
    update();
  }
}
