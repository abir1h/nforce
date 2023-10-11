import 'package:get/get.dart';

class ServiceItemsController extends GetxController {
  Rx<ServiceTabEnum> miniTabEnum = ServiceTabEnum.all.obs;
}

enum ServiceTabEnum { all, service, material, package, subscription, addons }
