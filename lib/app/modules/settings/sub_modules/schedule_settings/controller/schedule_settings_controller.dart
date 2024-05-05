import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum SwitchType { calendar, timeline, map }

class ScheduleSettingController extends GetxController {
  RxBool calendarSwitch = false.obs;
  RxBool timelineSwitch = false.obs;
  RxBool mapSwitch = false.obs;

  void triggerSwitch(SwitchType type, bool value) {
    if (type == SwitchType.calendar) {
      calendarSwitch.value = value;
    } else if (type == SwitchType.timeline) {
      timelineSwitch.value = value;
    } else if (type == SwitchType.map) {
      mapSwitch.value = value;
    }
  }
}