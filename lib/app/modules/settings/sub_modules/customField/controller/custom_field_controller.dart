import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum SwitchTypeCustomField { customField, Customer, agent, service, project, preorderFields }

class CustomFieldControllerSettings extends GetxController {
  RxBool customFieldSwitch = false.obs;
  RxBool customerSwitch = false.obs;
  RxBool agentSwitch = false.obs;
  RxBool serviceSwitch = false.obs;
  RxBool projectSwitch = false.obs;
  RxBool preorderFieldsSwitch = false.obs;

  void triggerSwitch(SwitchTypeCustomField type, bool value) {
    switch (type) {
      case SwitchTypeCustomField.customField:
        customFieldSwitch.value = value;
        break;
      case SwitchTypeCustomField.Customer:
        customerSwitch.value = value;
        break;
      case SwitchTypeCustomField.agent:
        agentSwitch.value = value;
        break;
      case SwitchTypeCustomField.service:
        serviceSwitch.value = value;
        break;
      case SwitchTypeCustomField.project:
        projectSwitch.value = value;
        break;
      case SwitchTypeCustomField.preorderFields:
        preorderFieldsSwitch.value = value;
        break;
    }
  }
}
