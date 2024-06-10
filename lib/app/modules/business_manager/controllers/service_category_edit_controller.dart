import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/services/service_category_api_service.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';

import '../../../utils/app_states.dart';

class ServiceCategoryEditController extends GetxController {
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
    await ServiceCategoryApiService.getCategoryForm(id).then((value) {
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

  Future<bool> addEditOrDeleteCategory({int? id, required ActionType action}) async {
    bool? result;
    setSaving(true);
    final appState = Get.find<AppState>();
    await ServiceCategoryApiService.setCategoryForm(
      id: id,
      businessId: appState.user?.businessId ?? 0,
      name: formBuilder.textEditingControllers['name']!.text,
      refCode: formBuilder.textEditingControllers['refCode']!.text,
      parentId: '${formBuilder.dropdownValue['parentId']?.value ?? ''}',
      description: formBuilder.textEditingControllers['description']!.text,
      detailsGoogleTaxonomyId: formBuilder.textEditingControllers['detailsGoogleTaxonomyId']!.text,
      displayOrder: formBuilder.textEditingControllers['displayOrder']!.text,
      policyIds: '${formBuilder.dropdownValue['policyIds']?.value ?? ''}',
      tags: formBuilder.stringTagControllers['tags']?.getTags ?? [],
      action: action,
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
    return result ?? false;
  }

/*  Future<bool?> addCategory({
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
  }*/
}
