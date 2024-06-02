import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/business_manager/role_model.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/services/user_role_api_services.dart';
import 'dart:developer' as developer show log;

import 'package:nuforce/app/shared/widgets/form_builder.dart';

class UserRoleController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    update();
  }

  RoleModel? _roleModel;
  RoleModel? get roleModel => _roleModel;
  set roleModel(RoleModel? value) {
    _roleModel = value;
    update();
  }

  Future<void> getRoles() async {
    isLoading = true;
    await UserRoleApiServices.getModelList().then((value) {
      value.fold(
        (success) {
          roleModel = success;
        },
        (r) {
          Fluttertoast.showToast(msg: r);
          developer.log(r, name: 'BusinessManagerCommissionTiersController.getLables');
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

  Future<void> getRoleForm([int? id]) async {
    isLoading = true;
    await UserRoleApiServices.getRoleForm(id).then((value) {
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
    await UserRoleApiServices.saveEditOrDelete(
      id: id,
      action: action,
      name: formBuilder.textEditingControllers['name']?.text ?? '',
      description: formBuilder.textEditingControllers['detailsDescription']?.text ?? '',
      subType: formBuilder.dropdownValue['subType']?.value ?? '',
      accessPolicy: formBuilder.dropdownValue['accessPolicy']?.value ?? '',
      accessModules: formBuilder.dropdownValue['detailsAccessModules']?.value ?? '',
    ).then((value) {
      value.fold(
        (l) async {
          isSuccess = true;
          Fluttertoast.showToast(msg: 'Role ${action.name} successful.');
          await getRoles();
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
