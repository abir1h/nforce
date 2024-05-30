import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/new_orders/services/note_api_service.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';

import '../models/work_order_success_model.dart';

class NoteController extends GetxController {
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

  Future<void> setContactForm() async {
    setLoading(true);
    await NoteApiService.getNoteForm().then((value) {
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

  Future<bool?> addNote({
    required String detailValue,
  }) async {
    bool? result;
    setSaving(true);
    final invoice = Get.arguments as Invoice;
    await NoteApiService.setNote(contactId: invoice.contactId!, detailValue: detailValue).then((value) {
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
