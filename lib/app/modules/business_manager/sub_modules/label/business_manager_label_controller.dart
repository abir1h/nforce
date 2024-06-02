import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/label_model.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/services/label_api_services.dart';
import 'dart:developer' as developer show log;

import 'package:nuforce/app/shared/widgets/form_builder.dart';

class BusinessManagerLabelController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    update();
  }

  LabelModel? _labelData;
  LabelModel? get labelData => _labelData;
  set labelData(LabelModel? labelModel) {
    _labelData = labelModel;
    update();
  }

  Future<void> getLables() async {
    isLoading = true;
    await LabelApiServices.getModelList().then((value) {
      value.fold(
        (success) {
          labelData = success;
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

  Future<void> setLabelForm([int? id]) async {
    isLoading = true;
    await LabelApiServices.getLabelForm(id).then((value) {
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
    await LabelApiServices.saveEditOrDelete(
      id: id,
      groupType: formBuilder.dropdownValue['subType']?.value ?? '',
      name: formBuilder.textEditingControllers['name']?.text ?? '',
      description: formBuilder.textEditingControllers['detailsDescription']?.text ?? '',
      color: formBuilder.dropdownValue['color']?.value ?? '',
      action: action,
    ).then((value) {
      value.fold(
        (l) async {
          isSuccess = true;
          Fluttertoast.showToast(msg: 'Label ${action.name} successfully.');
          await getLables();
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
