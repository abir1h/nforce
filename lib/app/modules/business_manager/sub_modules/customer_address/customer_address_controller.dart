import 'package:get/get.dart';

class CustomerAddressController extends GetxController {
  ContactDetailsTabEnum _tabEnum = ContactDetailsTabEnum.addresses;
  ContactDetailsTabEnum get tabEnum => _tabEnum;

  void updateTabEnum(ContactDetailsTabEnum tabEnum) {
    _tabEnum = tabEnum;
    update();
  }
}

enum ContactDetailsTabEnum {
  addresses,
  phones,
  emails,
  events,
  notes,
  licenses,
  serviceRegions,
}
