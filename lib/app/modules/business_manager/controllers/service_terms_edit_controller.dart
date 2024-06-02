import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/services/service_catelog_api_service.dart';
import 'package:nuforce/app/modules/business_manager/services/service_terms_api_service.dart';
import 'package:nuforce/app/modules/business_manager/services/service_topic_api_service.dart';
import 'package:nuforce/app/modules/new_orders/services/note_api_service.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';

import '../../../utils/app_states.dart';
import '../../contact/services/contact_api_services.dart';
import 'business_manager_terms_and_policy_controller.dart';

class ServiceTermsEditController extends GetxController {
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
   // setTermsForm();
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

  Future<void> setTermsForm([int? id]) async {
    setLoading(true);
    await ServiceTermsApiService.getServiceForm(id).then((value) {
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

  Future<bool?> addTerms([int? id]) async {
    bool? result;
    setSaving(true);
    final appState = Get.find<AppState>();
    await ServiceTermsApiService.setTermsForm(
      id: id,
      businessId: appState.user?.businessId ?? 0,
      name: formBuilder.textEditingControllers['name']!.text,
      policyType: '${formBuilder.dropdownValue['policyType']?.value ?? ''}',
      policyText: formBuilder.textEditingControllers['policyText']!.text,
      detailsDescription:
          formBuilder.textEditingControllers['detailsDescription']!.text,
      detailsInstructions:
          formBuilder.textEditingControllers['detailsInstructions']!.text,
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
