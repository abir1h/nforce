import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum SwitchTypeCalendarSync { weekNumber, declineEvents, syncAllEvents }

class CalendarSyncController extends GetxController {
  RxBool weekNumberSwitch = false.obs;
  RxBool declineEventsSwitch = false.obs;
  RxBool syncAllEventsSwitch = false.obs;

  void triggerSwitch(SwitchTypeCalendarSync type, bool value) {
    if (type == SwitchTypeCalendarSync.weekNumber) {
      weekNumberSwitch.value = value;
    } else if (type == SwitchTypeCalendarSync.declineEvents) {
      declineEventsSwitch.value = value;
    } else if (type == SwitchTypeCalendarSync.syncAllEvents) {
      syncAllEventsSwitch.value = value;
    }
  }
}
