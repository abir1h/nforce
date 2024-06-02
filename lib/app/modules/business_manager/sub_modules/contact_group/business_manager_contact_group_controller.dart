import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/contact_group_model.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/services/contact_group_api_service.dart';
import 'dart:developer' as developer show log;

import 'package:nuforce/app/shared/widgets/form_builder.dart';

class BusinessManagerContactGroupController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    update();
  }

  ContactGroupModel? _contactGroup;
  ContactGroupModel? get contactGroup => _contactGroup;
  set contactGroup(ContactGroupModel? contactGroup) {
    _contactGroup = contactGroup;
    update();
  }

  Future<void> getContactGroups() async {
    isLoading = true;
    await ContactGroupApiServices.getModelList().then((value) {
      value.fold(
        (success) {
          contactGroup = success;
        },
        (r) {
          Fluttertoast.showToast(msg: r);
          developer.log(r, name: 'BusinessManagerLabelController.getLables');
        },
      );
    });
    isLoading = false;
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

  Future<void> setContactGroupForm([int? id]) async {
    isLoading = true;
    await ContactGroupApiServices.getCustomerGroupForm(id).then((value) {
      value.fold(
        (controls) {
          setFormBuilder(getForm(controls: controls));
        },
        (error) {
          developer.log('Error: $error', name: 'setContactForm');
        },
      );
    });
    isLoading = false;
  }

  Future<bool> saveEditOrDelete({int? id, required ActionType action}) async {
    isLoading = true;
    bool isSuccess = false;
    await ContactGroupApiServices.saveEditOrDelete(
      id: id,
      name: formBuilder.textEditingControllers['name']?.text ?? '',
      description: formBuilder.textEditingControllers['detailsDescription']?.text ?? '',
      action: action,
    ).then((value) {
      value.fold(
        (l) async {
          isSuccess = true;
          Fluttertoast.showToast(msg: 'Contact group ${action.name} successfully.');
          await getContactGroups();
        },
        (r) {
          isSuccess = false;
          Fluttertoast.showToast(msg: r);
        },
      );
    });
    isLoading = false;
    return isSuccess;
  }
}
