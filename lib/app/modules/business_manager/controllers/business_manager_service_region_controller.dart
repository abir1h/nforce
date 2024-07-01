import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/service_region_model.dart';
import 'package:nuforce/app/modules/business_manager/services/service_region_api_service.dart';

class BusinessManagerServiceRegionController extends GetxController {
  List<ServiceRegionModel> regionList = [];
  bool isLoadingMore = false;
  int currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    getRegions();
  }

  getRegions({int page = 1}) {
    ServiceRegionApiService.getServiceRegions(page: page).then((value) {
      value.fold((l) {
        if (l.data!.isEmpty && page > 1) {
          isLoadingMore = false;
          return;
        }

        if (page == 1) {
          regionList = l.data!;
        } else {
          regionList.addAll(l.data!);
          currentPage = page; // Update currentPage only if new data is added
        }
        isLoadingMore = false;
        update();
      }, (r) {
        isLoadingMore = false;
        print(r);
      });
    });
  }

  loadMoreRegions() {
    if (!isLoadingMore) {
      isLoadingMore = true;
      getRegions(page: currentPage + 1);
    }
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
