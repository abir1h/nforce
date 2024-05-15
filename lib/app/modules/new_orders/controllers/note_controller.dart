import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/contact/services/contact_api_services.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart' as ctrl;
import 'package:nuforce/app/modules/new_orders/services/note_api_service.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';
import 'package:nuforce/app/utils/global_states.dart';

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

  void updateOnChanged(String name, ctrl.Option? value) {
    _formBuilder.dropdownValue[name] = value;
    update();
  }

  Future<void> setContactForm() async {
    setLoading(true);
    await NoteApiService.getContactForm().then((value) {
      value.fold(
            (controls) {
          log('Controls: $controls', name: 'setContactForm');
          setFormBuilder(getForm(controls: controls));
        },
            (r) {
          log('Error: $r', name: 'setContactForm');
        },
      );
    });
    setLoading(false);
  }

  Future<bool?> addContact({
    required String name,
    required String refCode,
    required String company,
    required List<String> tags,
    required String primaryEmail,
    required String primaryMobile,
    required String groupId,
  }) async {
    bool? result;
    setSaving(true);
    final appState = Get.find<AppState>();
    await ContactApiServices.setContact(
      businessId: appState.user?.businessId ?? 0,
      owner: '',
      name: name,
      refCode: refCode,
      company: company,
      tags: tags,
      primaryEmail: primaryEmail,
      primaryMobile: primaryMobile,
      groupId: groupId,
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
