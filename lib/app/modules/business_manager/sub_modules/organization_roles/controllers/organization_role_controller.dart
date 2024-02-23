import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/model/business_manager/role_model.dart';
import 'package:nuforce/app/modules/business_manager/apis/business_manager_api_services.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';

class OrganizationRoleController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void toggleLoading() {
    _isLoading = !_isLoading;
    update();
  }

  XFile? _image;
  XFile? get image => _image;

  FormModel? _businessRoleFormModel;
  FormModel? get businessRoleFormModel => _businessRoleFormModel;

  RoleModel _roleModel = RoleModel();
  RoleModel get roleModel => _roleModel;

  String? subTypeLabel;
  DropdownModel? _selectedSubType;
  DropdownModel? get selectedSubType => _selectedSubType;
  List<DropdownModel> subTypeList = [];
  void setSelectedSubType(DropdownModel value) {
    _selectedSubType = value;
    update();
  }

  String? accessPolicy;
  DropdownModel? _selectedaccessPolicy;
  DropdownModel? get selectedAccessPolicy => _selectedaccessPolicy;
  List<DropdownModel> accessPolicyList = [];
  void setSelectedAccessPolicy(DropdownModel value) {
    _selectedaccessPolicy = value;
    update();
  }

  String? detailsAccessModulesLabel;
  List<DropdownModel>? _selecteddetailsAccessModules;
  List<DropdownModel>? get selecteddetailsAccessModules => _selecteddetailsAccessModules;
  List<DropdownModel> detailsAccessModulesList = [];
  void setSelectedDetailsAccessModules(List<DropdownModel> value) {
    _selecteddetailsAccessModules = value;
    update();
  }

  String? profileLogoUrl;

  String nameLable = '';
  final TextEditingController nameController = TextEditingController();

  String detailsDescriptionLabel = '';
  final TextEditingController detailsDescriptionController = TextEditingController();

  bool active = false;

  String submitButtonLabel = '';
  String deleteButtonLabel = '';

  String resetWarning = '';
  bool showResetWarning = false;

  Future<void> setImage() async {
    _image = await pickImage(ImageSource.gallery);
    update();
  }

  Future<void> removeImage() async {
    _image = null;
    update();
  }

  Future<void> getData() async {
    _isLoading = true;
    update();
    await BusinessManagerApiServices.getRoles().then((value) {
      value.fold(
        (l) {
          _roleModel = l;
          update();
        },
        (r) {},
      );
    });
    setData();
    _isLoading = false;
    update();
  }

  Future<void> getFormData([int? id]) async {
    _isLoading = true;
    update();

    Map<String, dynamic> body = {};

    if (id != null) {
      body = {
        "data": {},
        "query": {
          "id": id,
        }
      };
    } else {
      body['data'] = {
        {
          "data": {
            "groupType": "role",
            "name": "",
          },
          "query": {}
        }
      };
    }

    await BusinessManagerApiServices.businessRoleForm().then((value) {
      value.fold(
        (l) {
          _businessRoleFormModel = l;
          update();
        },
        (r) {},
      );
    });
    setData();
    _isLoading = false;
    update();
  }

  void setData() {
    try {
      _businessRoleFormModel?.controls?.forEach((control) {
        if (control.name == 'name') {
          log('name23123: ${control.toJson()}');
          nameLable = control.label ?? 'Name';
          nameController.text = control.value ?? 'N/A';
        } else if (control.name == 'subType' && control.editor == 'dropdown') {
          subTypeLabel = control.label ?? 'For';
          if (subTypeList.isEmpty) {
            control.options?.forEach((element) {
              subTypeList.add(DropdownModel(label: element.label, value: element.value));
            });
          }
          for (final type in subTypeList) {
            if (control.value == type.value) {
              _selectedSubType = type;
              break;
            } else {
              _selectedSubType = null;
            }
          }
        } else if (control.name == 'accessPolicy' && control.editor == 'dropdown') {
          accessPolicy = control.label ?? 'Access Policy';
          if (accessPolicyList.isEmpty) {
            control.options?.forEach((element) {
              accessPolicyList.add(DropdownModel(label: element.label, value: element.value));
            });
          }
          for (final type in accessPolicyList) {
            if (control.value == type.value) {
              _selectedaccessPolicy = type;
              break;
            } else {
              _selectedaccessPolicy = null;
            }
          }
        } else if (control.name == 'detailsDescription') {
          detailsDescriptionLabel = control.label ?? 'Details Description';
          detailsDescriptionController.text = control.value ?? 'N/A';
        } else if (control.name == 'detailsAccessModules') {
          detailsAccessModulesLabel = control.label ?? 'Access Areas';
          if (detailsAccessModulesList.isEmpty) {
            control.options?.forEach((element) {
              detailsAccessModulesList.add(DropdownModel(label: element.label, value: element.value));
            });
          }
          _selecteddetailsAccessModules = [];
          // TODO need to work on this part
        } else if (control.name == 'active' && control.editor == 'dropdown') {
          active = true;
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    update();
  }

  void resetForm() {
    if (_businessRoleFormModel != null) {
      setData();
    } else {
      profileLogoUrl = null;
      nameController.text = '';
      _selectedSubType = null;
      _selectedaccessPolicy = null;
      detailsDescriptionController.text = '';
      _selecteddetailsAccessModules = [];
      active = false;
      update();
    }
  }

  Future<Either<String, String>> submitForm() async {
    toggleLoading();
    try {
      final Map<String, dynamic> body = {
        'action': 'submit',
        'data': {
          'business_id': appState.user?.businessId,
          'params.org_code': appState.user?.orgCode,
          'group_type': 'role', // TODO remove hard code
          'group_code': '', // TODO remove hard code
        },
      };

      _businessRoleFormModel?.controls?.forEach((control) {
        if (control.name == 'name') {
          body['data'][control.key!] = nameController.text;
        } else if (control.name == 'sub_type') {
          body['data'][control.key!] = _selectedSubType?.value;
        } else if (control.name == 'access_policy') {
          body['data'][control.key!] = _selectedaccessPolicy?.value;
        } else if (control.name == 'details.description') {
          body['data'][control.key!] = detailsDescriptionController.text;
        } else if (control.name == 'details.access_modules') {
          // TODO need to work on this part
        } else if (control.name == 'active') {
          body['data'][control.key!] = active ? 1 : 0;
        }
      });
      await BusinessManagerApiServices.businessRoleForm(body: body).then((value) {
        value.fold(
          (l) {
            return const Left('Success');
          },
          (r) {
            return Right(r);
          },
        );
      });
      toggleLoading();
      return const Left('Success');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      toggleLoading();
      return const Right('Error');
    }
  }
}

class DropdownModel {
  final String? label;
  final String? value;

  DropdownModel({
    this.label,
    this.value,
  });
}
