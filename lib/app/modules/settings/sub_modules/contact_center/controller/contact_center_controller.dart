import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/contact_center/models/contact_center_model.dart';

class ContactCenterController extends GetxController {
  ContactCenter? contactCenter;
  TextEditingController titleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController officeNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  addContactCenter() {
    contactCenter = ContactCenter(
      title: titleController.text,
      email: emailController.text,
      description: descriptionController.text,
      officeAdress: addressController.text,
      officeName: officeNameController.text,
      phoneNumber: phoneController.text,
    );
    Get.back();
    update();
  }

  removeContactCenter() {
    contactCenter = null;
    Get.back();

    update();
  }
}
