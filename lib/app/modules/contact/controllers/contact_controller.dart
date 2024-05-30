import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/contact/services/contact_api_services.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';
import 'package:nuforce/app/utils/app_states.dart';

class ContactController extends GetxController {
  @override
  void dispose() {
    formBuilder.textEditingControllers.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    setContactForm();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool _isSaving = false;
  bool get isSaving => _isSaving;
  void setSaving(bool value) {
    _isSaving = value;
    update();
  }

  CustomFormBuilder _formBuilder = CustomFormBuilder();
  CustomFormBuilder get formBuilder => _formBuilder;
  void setFormBuilder(CustomFormBuilder value) {
    _formBuilder = value;
    update();
  }

  void updateOnChanged(String name, Option? value) {
    _formBuilder.dropdownValue[name] = value;
    update();
  }

  Future<void> setContactForm([int? id]) async {
    setLoading(true);
    await ContactApiServices.getContactForm(id).then((value) {
      value.fold(
        (controls) {
          setFormBuilder(getForm(controls: controls));
        },
        (r) {
          log('Error: $r', name: 'setContactForm');
        },
      );
    });
    setLoading(false);
  }

  Future<bool?> addContact([int? id]) async {
    bool? result;
    setSaving(true);
    final appState = Get.find<AppState>();
    await ContactApiServices.setContact(
      id: id,
      businessId: appState.user?.businessId ?? 0,
      owner: '',
      name: formBuilder.textEditingControllers['name']?.text ?? '',
      refCode: formBuilder.textEditingControllers['refCode']?.text ?? '',
      company: formBuilder.textEditingControllers['detailsCompany']?.text ?? '',
      tags: formBuilder.stringTagControllers['tags']?.getTags ?? [],
      primaryEmail: formBuilder.textEditingControllers['detailsPrimaryEmail']?.text ?? '',
      primaryMobile: formBuilder.textEditingControllers['detailsPrimaryMobile']?.text ?? '',
      groupId: '${formBuilder.dropdownValue['groupId']?.value ?? ''}',
    ).then((value) {
      value.fold(
        (success) {
          result = true;
          Fluttertoast.showToast(msg: success);
        },
        (r) {
          Fluttertoast.showToast(msg: r);
        },
      );
    });
    setSaving(false);
    return result;
  }
}
