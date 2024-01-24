import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class BusinessManagerTermsAndPolicyController extends GetxController {
  final List<MockTermsAndPolicy> _mockTermsAndPolicy = [];

  List<MockTermsAndPolicy> get mockTermsAndPolicy => _mockTermsAndPolicy;

  void addTermsAndPolicy(MockTermsAndPolicy mockTermsAndPolicy) {
    _mockTermsAndPolicy.add(mockTermsAndPolicy);
    update();
  }

  void updateTermsAndPolicy(MockTermsAndPolicy mockTermsAndPolicy) {
    final index = _mockTermsAndPolicy.indexWhere((element) => element.id == mockTermsAndPolicy.id);
    _mockTermsAndPolicy[index] = mockTermsAndPolicy;
    update();
  }

  void removeTermsAndPolicy(MockTermsAndPolicy mockTermsAndPolicy) {
    _mockTermsAndPolicy.remove(mockTermsAndPolicy);
    update();
  }
}

class MockTermsAndPolicy extends Equatable {
  final String id;
  final String policyName;
  final String policyType;
  final String briefDescription;
  final String instructions;
  final bool availableToNewProposals;
  final String policy; // TODO convert it to rich text

  const MockTermsAndPolicy({
    required this.id,
    required this.policyName,
    required this.policyType,
    required this.briefDescription,
    required this.instructions,
    required this.availableToNewProposals,
    required this.policy,
  });

  @override
  List<Object?> get props => [id, policyName, policyType, briefDescription, instructions, availableToNewProposals, policy];
}
