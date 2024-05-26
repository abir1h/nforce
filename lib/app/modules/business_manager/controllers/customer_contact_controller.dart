import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/customers.dart';

import "package:nuforce/app/modules/business_manager/models/customer_contact_model.dart";
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/services/customer_contact_api_services.dart';

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
    getCustomers();
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

  //? ----------------- Real Data ----------------- ¿//
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Customers? _customers;
  Customers? get customers => _customers;
  set customers(Customers? value) {
    _customers = value;
    update();
  }

  Future<void> getCustomers({bool showLoading = true}) async {
    if (showLoading) {
      isLoading = true;
    }
    await CustomerContactApiServices.getCustomers().then((value) {
      value.fold(
        (data) {
          customers = data;
        },
        (error) {
          Fluttertoast.showToast(msg: error);
        },
      );
    });
    isLoading = false;
  }
}
