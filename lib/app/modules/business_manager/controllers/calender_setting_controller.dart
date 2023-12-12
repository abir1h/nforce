import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/calendar_setting_model.dart';

class CalenderSettingController extends GetxController {
  //region Dropdown Data

  String? taskDuration;
  String? startAt;
  String? endAt;
  String? selectedServiceCalender = "Select One";
  String? selectedOfficeCalender = "Select One";

  List serviceCalendarList = [
    "Select One",
    "Service Calendar 1",
    "Service Calendar 2",
    "Service Calendar 3",
  ];
  List officeCalendarList = [
    "Select One",
    "office Calendar 1",
    "office Calendar 2",
    "office Calendar 3",
  ];

  void setServiceCalendar(String value) {
    selectedServiceCalender = value;
    update();
  }

  void setOfficeCalendar(String value) {
    selectedOfficeCalender = value;
    update();
  }

  void setTaskDuration(String value) {
    taskDuration = value;
    update();
  }

  void setStartAt(String value) {
    startAt = value;
    update();
  }

  void setEndAt(String value) {
    endAt = value;
    update();
  }

  void reset() {
    taskDuration=null;
    selectedOfficeCalender=officeCalendarList.first;
    selectedServiceCalender=serviceCalendarList.first;
    startAt=null;
    endAt=null;
    update();
  }
  void delete() {
   taskDuration=null;
   selectedOfficeCalender=officeCalendarList.first;
   selectedServiceCalender=serviceCalendarList.first;
   startAt=null;
   endAt=null;
   calendarSettingData=null;
   update();
  }

  //endregion

  CalendarSettingModel? calendarSettingData;

  addRegionalSetting(CalendarSettingModel data) {
    calendarSettingData = data;
    update();
  }
}
