import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/calendar_list_model.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'dart:developer' as developer show log;

import 'package:nuforce/app/shared/widgets/form_builder.dart';
import 'package:nuforce/app/utils/app_states.dart';

class BusinessManagerCalendarController extends GetxController {
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

  final List<CalendarData> _calendarData = [];
  List<CalendarData> get calendarData => _calendarData;
  set calendarData(List<CalendarData>? calendarData) {
    _calendarData.clear();
    if (calendarData != null) {
      _calendarData.addAll(calendarData);
    }
    update();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Future<void> getCalendarList() async {
    isLoading = true;
    await BusinessManagerCalendarApiServices.getCalendarList().then((value) {
      value.fold(
        (success) {
          calendarData = success.data;
        },
        (error) {
          developer.log(error, name: 'BusinessManagerCalendarController');
          Fluttertoast.showToast(msg: 'Error occurred while fetching calendar list.');
        },
      );
    });
    isLoading = false;
  }

  Future<void> setContactForm([int? id]) async {
    isLoading = true;
    await BusinessManagerCalendarApiServices.getCalendarForm(id).then((value) {
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

  Future<bool> saveEditOrDelete({int? calendarId, required ActionType action}) async {
    isLoading = true;
    bool isSuccess = false;
    final appState = Get.find<AppState>();
    await BusinessManagerCalendarApiServices.saveEditOrDelete(
      id: calendarId ?? -1,
      businessId: appState.user?.businessId ?? -1,
      owner: appState.user?.businessName ?? '',
      context: 'business',
      name: formBuilder.textEditingControllers['name']?.text ?? '',
      description: formBuilder.textEditingControllers['description']?.text ?? '',
      timezone: formBuilder.dropdownValue['timezone']?.value ?? '',
      color: formBuilder.dropdownValue['color']?.value ?? '',
      action: action,
    ).then((value) {
      value.fold(
        (l) async {
          isSuccess = true;
          Fluttertoast.showToast(msg: 'Calendar ${action.name} successfully.');
          await getCalendarList();
        },
        (r) {
          isSuccess = false;
        },
      );
    });
    isLoading = false;
    return isSuccess;
  }
}
