import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import "package:nuforce/app/modules/business_manager/models/customer_contact_model.dart";

class CustomerContactController extends GetxController {
  List<CustomerContactModel> customerList = [];
  TextEditingController name = TextEditingController();
  TextEditingController refCode = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController tags = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  String? selectFolder = 'Customer';
  List<String> folderList = ['Customer', 'Others'];
  void saveCustomerContact(CustomerContactModel data) {
    customerList.add(data);
    update();
  }

  void setFolder(String value) {
    selectFolder = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    reset();
  }

  void populateFieldsFromModel(CustomerContactModel? model) {
    name.text = model!.name ?? '';
    refCode.text = model.refCode ?? '';
    company.text = model.companyName ?? '';
    tags.text = model.tags ?? '';
    email.text = model.email ?? '';
    mobile.text = model.mobile ?? '';
    selectFolder = model.folderName ?? 'Customer';
    update();
  }

  @override
  void dispose() {
    super.dispose();
    reset();
  }

  void reset() {
    name.clear();
    refCode.clear();
    company.clear();
    tags.clear();
    email.clear();
    mobile.clear();
    update();
  }
}
