import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum SwitchTypeNotifcation { pushNotification, sound, vibrate, email, sms }

class NotificationController extends GetxController {
  RxBool pushNotificationSwitch = false.obs;
  RxBool soundSwitch = false.obs;
  RxBool vibrateSwitch = false.obs;
  RxBool emailSwitch = false.obs;
  RxBool smsSwitch = false.obs;

  void triggerSwitch(SwitchTypeNotifcation type, bool value) {
    switch (type) {
      case SwitchTypeNotifcation.pushNotification:
        pushNotificationSwitch.value = value;
        break;
      case SwitchTypeNotifcation.sound:
        soundSwitch.value = value;
        break;
      case SwitchTypeNotifcation.vibrate:
        vibrateSwitch.value = value;
        break;
      case SwitchTypeNotifcation.email:
        emailSwitch.value = value;
        break;
      case SwitchTypeNotifcation.sms:
        smsSwitch.value = value;
        break;
    }
  }
}
