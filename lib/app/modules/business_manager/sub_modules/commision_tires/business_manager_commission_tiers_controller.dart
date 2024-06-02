import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/commission_data_model.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'dart:developer' as developer show log;

import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/services/commission_tire_api_services.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';

class BusinessManagerCommissionTiersController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    update();
  }

  CommissionDataModel? _commissionTier;
  CommissionDataModel? get commissionTier => _commissionTier;
  set commissionTier(CommissionDataModel? commission) {
    _commissionTier = commission;
    update();
  }

  Future<void> getComissions() async {
    isLoading = true;
    await CommissionApiServices.getModelList().then((value) {
      value.fold(
        (success) {
          commissionTier = success;
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

  Future<void> getCommissionForm([int? id]) async {
    isLoading = true;
    await CommissionApiServices.getCommissionForm(id).then((value) {
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
    await CommissionApiServices.saveEditOrDelete(
      id: id,
      name: formBuilder.textEditingControllers['name']?.text ?? '',
      description: formBuilder.textEditingControllers['detailsDescription']?.text ?? '',
      action: action,
      defaultValue: formBuilder.textEditingControllers['detailsDefaultValue']?.text ?? '',
      initialValue: formBuilder.textEditingControllers['detailsInitialValue']?.text ?? '',
      rewardPer: formBuilder.dropdownValue['detailsRewardPer']?.value ?? '',
      rewardSource: formBuilder.dropdownValue['detailsRewardSource']?.value ?? '',
    ).then((value) {
      value.fold(
        (l) async {
          isSuccess = true;
          Fluttertoast.showToast(msg: 'Label ${action.name} successfully.');
          await getComissions();
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
