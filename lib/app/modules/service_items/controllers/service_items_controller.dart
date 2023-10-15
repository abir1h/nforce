import 'package:get/get.dart';

class ServiceItemsController extends GetxController {
  Rx<ServiceTabEnum> miniTabEnum = ServiceTabEnum.all.obs;
  Rx<SelectedServiceTabEnum> selectedServiceTabEnum = SelectedServiceTabEnum.overview.obs;
}

enum ServiceTabEnum { all, service, material, package, subscription, addons }

enum SelectedServiceTabEnum { overview, subItems, settings, content }
