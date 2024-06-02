import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/services/service_catelog_api_service.dart';

import '../models/service_catelog_model.dart';

class BusinessManagerServiceCatalogsController extends GetxController {
  List<ServiceCategoryModel> categoryList = [];

  @override
  void onInit() {
    super.onInit();
    getServiceCategories();
  }
  getServiceCategories() {
    ServiceCatelogsApiService.getServiceCategories().then((value) {
      value.fold((l) {
        categoryList = l.data!;
        update();
      }, (r) => print(r));
    });
  }
}

class MockServiceCatalog extends Equatable {
  final String id;
  final String name;
  final String refCode;
  final String parentCategory;
  final String googleTaxonomy;
  final String displayOrder;
  final String termsAndConditions;
  final String tags;
  final String description;

  const MockServiceCatalog({
    required this.id,
    required this.name,
    required this.refCode,
    required this.parentCategory,
    required this.googleTaxonomy,
    required this.displayOrder,
    required this.termsAndConditions,
    required this.tags,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        refCode,
        parentCategory,
        googleTaxonomy,
        displayOrder,
        termsAndConditions,
        tags,
        description
      ];
}
