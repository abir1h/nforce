import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class BusinessManagerServiceCatalogsController extends GetxController {
  final List<MockServiceCatalog> _mockServiceCatalogs = [];

  List<MockServiceCatalog> get mockServiceCatalogs => _mockServiceCatalogs;

  void addServiceCatalog(MockServiceCatalog serviceCategory) {
    _mockServiceCatalogs.add(serviceCategory);
    update();
  }

  void updateServiceCatalog(MockServiceCatalog serviceCategory) {
    final index = _mockServiceCatalogs.indexWhere((element) => element.id == serviceCategory.id);
    _mockServiceCatalogs[index] = serviceCategory;
    update();
  }

  void removeServiceCatalog(MockServiceCatalog serviceCategory) {
    _mockServiceCatalogs.remove(serviceCategory);
    update();
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
  List<Object?> get props => [id, name, refCode, parentCategory, googleTaxonomy, displayOrder, termsAndConditions, tags, description];
}
