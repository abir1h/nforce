import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/services/service_region_api_service.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';
import '../../../utils/app_states.dart';

class ServiceRegionEditController extends GetxController {
  @override
  void dispose() {
    formBuilder.textEditingControllers.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
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

  Future<void> setRegionForm([int? id]) async {
    setLoading(true);
    await ServiceRegionApiService.getRegionForm(id).then((value) {
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

  Future<bool?> addRegion({int? id, required ActionType action}) async {
    bool? result;
    setSaving(true);
    final appState = Get.find<AppState>();
    await ServiceRegionApiService.setRegionForm(
      id: id,
      businessId: appState.user?.businessId ?? 0,
      name: formBuilder.textEditingControllers['name']?.text??'',
      groupCode: formBuilder.textEditingControllers['groupCode']?.text??"",
      detailsPrefixCode: formBuilder.textEditingControllers['detailsPrefixCode']?.text??"",
      subType: '${formBuilder.dropdownValue['subType']?.value ?? ''}',
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
