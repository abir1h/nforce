import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class BusinessManagerServiceRegionController extends GetxController {
  final List<MockServiceRegion> _mockServiceRegion = [];

  List<MockServiceRegion> get mockServiceRegion => _mockServiceRegion;

  void addServiceRegion(MockServiceRegion mockServiceRegion) {
    _mockServiceRegion.add(mockServiceRegion);
    update();
  }

  void updateServiceRegion(MockServiceRegion mockServiceRegion) {
    final index = _mockServiceRegion.indexWhere((element) => element.id == mockServiceRegion.id);
    _mockServiceRegion[index] = mockServiceRegion;
    update();
  }

  void removeServiceRegion(MockServiceRegion mockServiceRegion) {
    _mockServiceRegion.remove(mockServiceRegion);
    update();
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
