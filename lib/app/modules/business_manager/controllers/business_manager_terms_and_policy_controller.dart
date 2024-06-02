import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/service_terms_model.dart';
import 'package:nuforce/app/modules/business_manager/services/service_terms_api_service.dart';

class BusinessManagerTermsAndPolicyController extends GetxController {
  List<ServiceTermsModel> termsList = [];

  @override
  void onInit() {
    super.onInit();
    getServiceTerms();
  }

  getServiceTerms() {
    ServiceTermsApiService.getServiceTerms().then((value) {
      value.fold(
        (l) {
          termsList = l.data!;
          update();
        },
        (r) {
          Fluttertoast.showToast(msg: r);
        },
      );
    });
  }
}

class MockTermsAndPolicy extends Equatable {
  final String id;
  final String policyName;
  final String policyType;
  final String briefDescription;
  final String instructions;
  final bool availableToNewProposals;
  final String policy;

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
