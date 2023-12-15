import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class BusinessManagerCommissionTiersController extends GetxController {
  final List<MockCommissionTier> _mockCommissionTier = [];

  List<MockCommissionTier> get mockCommissionTier => _mockCommissionTier;

  void addCommissionTier(MockCommissionTier commissionTier) {
    _mockCommissionTier.add(commissionTier);
    update();
  }

  void updateCommissionTier(MockCommissionTier commissionTier) {
    final index = _mockCommissionTier.indexWhere((element) => element.id == commissionTier.id);
    _mockCommissionTier[index] = commissionTier;
    update();
  }

  void removeCommissionTier(MockCommissionTier commissionTier) {
    _mockCommissionTier.remove(commissionTier);
    update();
  }
}

class MockCommissionTier extends Equatable {
  final String id;
  final String tierName;
  final double rate;
  final double firstRate;
  final String? source;
  final String? rewardOn;
  final String? description;

  const MockCommissionTier({
    required this.id,
    required this.tierName,
    required this.rate,
    required this.firstRate,
    this.source,
    this.rewardOn,
    this.description,
  });

  @override
  List<Object?> get props => [id, tierName, rate, firstRate, source, rewardOn, description];
}
