import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/models/service_manager_data_model.dart';
import 'package:nuforce/app/modules/service_items/services/service_manager_api_service.dart';

class ServiceItemsController extends GetxController {
  ScrollController scrollController = ScrollController();

  Rx<ServiceTabEnum> miniTabEnum = ServiceTabEnum.all.obs;
  Rx<SelectedServiceTabEnum> selectedServiceTabEnum = SelectedServiceTabEnum.overview.obs;

  List<ServiceMangerItemModel> allItems = [];
  List<ServiceMangerItemModel> serviceItems = [];
  List<ServiceMangerItemModel> materialItems = [];
  List<ServiceMangerItemModel> packageItems = [];
  List<ServiceMangerItemModel> subscriptionItems = [];
  List<ServiceMangerItemModel> addonsItems = [];
  bool dataLoaded=false;

  @override
  void onInit() {
    super.onInit();
    getServiceCategoriesByTab(miniTabEnum.value);
  }

  void getServiceCategoriesByTab(ServiceTabEnum tab) {
    switch (tab) {
      case ServiceTabEnum.all:
        getServiceCategories(items: allItems);
        break;
      case ServiceTabEnum.service:
        getServiceCategories(type: ServiceTabEnum.service.name, items: serviceItems);
        break;
      case ServiceTabEnum.material:
        getServiceCategories(type: ServiceTabEnum.material.name, items: materialItems);
        break;
      case ServiceTabEnum.package:
        getServiceCategories(type: ServiceTabEnum.package.name, items: packageItems);
        break;
      case ServiceTabEnum.subscription:
        getServiceCategories(type: ServiceTabEnum.subscription.name, items: subscriptionItems);
        break;
      case ServiceTabEnum.addons:
        getServiceCategories(type: ServiceTabEnum.addons.name, items: addonsItems);
        break;
    }
  }

  void getServiceCategories({String? type, List<ServiceMangerItemModel>? items}) {
    items?.clear();
    ServiceMangerApiService.getServiceMangerItems(type).then((result) {
      result.fold((left) {
        if (items != null) {
          items.addAll(left.data!);

        } else {
          allItems = left.data!;
        }
        dataLoaded=true;

        update();
      }, (right) => print(right));
    });
  }
}

enum ServiceTabEnum { all, service, material, package, subscription, addons }
enum SelectedServiceTabEnum { overview, subItems, settings, content }
