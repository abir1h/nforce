import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/service_region_model.dart';
import 'package:nuforce/app/modules/business_manager/services/service_region_api_service.dart';

class BusinessManagerServiceRegionController extends GetxController {
  List<ServiceRegionModel> regionList = [];

  @override
  void onInit() {
    super.onInit();
    getRegions();
  }

  getRegions() {
    ServiceRegionApiService.getServiceRegions().then((value) {
      value.fold((l) {
        regionList = l.data!;
        update();
      }, (r) => print(r));
    });
  }
}

class MockServiceRegion extends Equatable {
  final String id;
  final String name;
  final String? type;
  final String? address;
  final String? dialPrefix;
  final String? status;

  const MockServiceRegion({
    required this.id,
    required this.name,
    this.type,
    this.address,
    this.dialPrefix,
    this.status,
  });

  @override
  List<Object?> get props => [id, name, type, address, dialPrefix, status];
}
