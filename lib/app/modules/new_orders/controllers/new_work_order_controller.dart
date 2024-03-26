import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/models/contact_details_model.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_contact_search_model.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_service_package_model.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_service_region_model.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_success_model.dart';
import 'package:nuforce/app/modules/new_orders/services/work_order_api_service.dart';

class NewWorkOrderController extends GetxController {
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    update();
  }

  bool _contactLoading = false;
  bool get contactLoading => _contactLoading;
  void setContactLoading(bool value) {
    _contactLoading = value;
    update();
  }

  WorkOrderServiceRegionModel _serviceRegionModel = WorkOrderServiceRegionModel();
  WorkOrderServiceRegionModel get serviceRegionModel => _serviceRegionModel;
  ServiceRegion? _selectedServiceRegion;
  ServiceRegion? get selectedServiceRegion => _selectedServiceRegion;

  void setSelectedServiceRegion(ServiceRegion serviceRegion) {
    _selectedServiceRegion = serviceRegion;
    update();
  }

  void clearSelectedServiceRegion() {
    _selectedServiceRegion = null;
    update();
  }

  void addServiceRegion(WorkOrderServiceRegionModel serviceRegionModel) {
    _serviceRegionModel = serviceRegionModel;
    update();
  }

  void clearServiceRegion() {
    _serviceRegionModel = WorkOrderServiceRegionModel();
    update();
  }

  Future<void> getServiceRegion() async {
    setLoading(true);
    await WorkOrderApiService.fetchServiceRegion().then(
      (response) {
        response.fold(
          (serviceRegionModel) {
            addServiceRegion(serviceRegionModel);
          },
          (error) {
            Fluttertoast.showToast(msg: error);
          },
        );
      },
    );
    setLoading(false);
  }

  WorkOrderServicePackageModel _servicePackageModel = WorkOrderServicePackageModel();
  WorkOrderServicePackageModel get servicePackageModel => _servicePackageModel;
  ServicePackage? _selectedServicePackage;
  ServicePackage? get selectedServicePackage => _selectedServicePackage;

  void setSelectedServicePackage(ServicePackage servicePackage) {
    _selectedServicePackage = servicePackage;
    update();
  }

  void clearSelectedServicePackage() {
    _selectedServicePackage = null;
    update();
  }

  void addServicePackage(WorkOrderServicePackageModel servicePackageModel) {
    _servicePackageModel = servicePackageModel;
    update();
  }

  Future<void> fetchServicePackages() async {
    setLoading(true);
    await WorkOrderApiService.fetchServicePackages().then(
      (response) {
        response.fold(
          (servicePackageModel) {
            addServicePackage(servicePackageModel);
          },
          (error) {
            Fluttertoast.showToast(msg: error);
          },
        );
      },
    );
    setLoading(false);
  }

  final List<WorkOrderContactSearch> _contactSearchList = [];
  List<WorkOrderContactSearch> get contactSearchList => _contactSearchList;
  WorkOrderContactSearch? _selectedContact;
  WorkOrderContactSearch? get selectedContact => _selectedContact;

  bool _showSearchList = false;
  bool get showSearchList => _showSearchList;
  void setShowSearchList(bool value) {
    _showSearchList = value;
    update();
  }

  void setSelectedContact(WorkOrderContactSearch contact) {
    _selectedContact = contact;
    update();
  }

  void addContactSearchList(List<WorkOrderContactSearch> contactSearchList) {
    _contactSearchList.clear();
    _contactSearchList.addAll(contactSearchList);
    update();
  }

  void clearContactSearchList() {
    _contactSearchList.clear();
    update();
  }

  Future<void> contactLookup(String query) async {
    setContactLoading(true);
    await WorkOrderApiService.contactLookup(query).then(
      (response) {
        response.fold(
          (contactSearchList) {
            setShowSearchList(true);
            addContactSearchList(contactSearchList);
          },
          (error) {
            setShowSearchList(false);
            Fluttertoast.showToast(msg: error);
          },
        );
      },
    );
    setContactLoading(false);
  }

  ContactDetails _contactDetails = ContactDetails();
  ContactDetails get contactDetails => _contactDetails;

  void addContactDetails(ContactDetails contactDetails) {
    _contactDetails = contactDetails;
    update();
  }

  Future<void> getContactDetails() async {
    setLoading(true);
    final id = selectedContact?.id;
    if (id == null) {
      setLoading(false);
      return;
    }
    await WorkOrderApiService.getContactDetails(id.toString()).then(
      (response) {
        response.fold(
          (contactDetails) {
            addContactDetails(contactDetails);
            log('Contact Details: ${contactDetails.toJson()}');
          },
          (error) {
            Fluttertoast.showToast(msg: error);
          },
        );
      },
    );
    setLoading(false);
  }

  WorkOrderSuccessModel _workOrderSuccessModel = WorkOrderSuccessModel();
  WorkOrderSuccessModel get workOrderSuccessModel => _workOrderSuccessModel;

  void addWorkOrderSuccessModel(WorkOrderSuccessModel workOrderSuccessModel) {
    _workOrderSuccessModel = workOrderSuccessModel;
    update();
  }

  Future<bool> createWorkOrder({
    required int contactId,
    required int billingAddressId,
    required int serviceId,
    required int regionId,
    String? taxExempt,
    String? standalone,
  }) async {
    bool isSuccess = false;
    setLoading(true);
    await WorkOrderApiService.createWorkOrder(
      contactId: contactId,
      billingAddressId: billingAddressId,
      serviceId: serviceId,
      regionId: regionId,
      taxExempt: taxExempt,
      standalone: standalone,
    ).then(
      (response) {
        response.fold(
          (workOrderSuccessModel) {
            addWorkOrderSuccessModel(workOrderSuccessModel);
            isSuccess = true;
          },
          (error) {
            Fluttertoast.showToast(msg: error);
          },
        );
      },
    );
    setLoading(false);
    return isSuccess;
  }
}
