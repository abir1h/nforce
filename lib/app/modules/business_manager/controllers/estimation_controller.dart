import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nuforce/app/modules/business_manager/models/regional_setting.dart';

import '../models/calendar_setting_model.dart';
import '../models/estimation_setting_model.dart';

class EstimationSettingController extends GetxController {
  //region Dropdown Data
  TextEditingController commonPoliceController = TextEditingController();
  String? expirationPeriod;
  String? advancePayment;
  String? cancellationFee;
  String? selectTaxExempt = "Allow";
  String? selectLockEstimation = "Not Allow";
  String? selectIssues = "Not Allow";
  List commonPolices = [];

  List taxExemptList = ["Allow", "Not Allow"];
  List lockEstimationList = ["Allow", "Not Allow"];
  List issuesList = ["Allow", "Not Allow"];

  void setExpiration(String value) {
    expirationPeriod = value;
    update();
  }

  void setCancellation(String value) {
    cancellationFee = value;
    update();
  }

  void setTaxtExempt(String value) {
    selectTaxExempt = value;
    update();
  }

  void setLockEstimation(String value) {
    selectLockEstimation = value;
    update();
  }

  void setIssue(String value) {
    selectIssues = value;
    update();
  }

  void setCommonPolicySingle(String value) {
    commonPolices.add(value);
    commonPoliceController.clear();
    update();
  }

  void deleteCommonPolicySingle(int index) {
    commonPolices.removeAt(index);
    update();
  }

  void add(int index) {
    commonPolices.removeAt(index);
    update();
  }

  void reset() {
    /* taskDuration=null;
    selectedOfficeCalender=officeCalendarList.first;
    selectedServiceCalender=serviceCalendarList.first;
    startAt=null;
    endAt=null;
    update();*/
    expirationPeriod;
    advancePayment;
    String? cancellationFee;
  }

  void delete() {
    /*taskDuration=null;
    selectedOfficeCalender=officeCalendarList.first;
    selectedServiceCalender=serviceCalendarList.first;
    startAt=null;
    endAt=null;
    calendarSettingData=null;
    update();*/
  }

  //endregion

  EstimationSettingModel? estimationSettingData;

  addEstimationData(EstimationSettingModel data) {
    estimationSettingData = data;
    update();
  }
}
