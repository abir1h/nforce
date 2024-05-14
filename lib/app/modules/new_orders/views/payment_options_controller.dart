import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/company_payment_options.dart';
import 'package:nuforce/app/modules/new_orders/services/payment_options_api_services.dart';
import 'package:nuforce/app/utils/global_states.dart';

class PaymentOptionsController extends GetxController {
  @override
  onInit() {
    super.onInit();
    getCompanyPaymentOptions();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  PaymentOption? _selectedPaymentOption;
  PaymentOption? get selectedPaymentOption => _selectedPaymentOption;
  set selectedPaymentOption(PaymentOption? value) {
    _selectedPaymentOption = value;
    update();
  }

  CompanyPaymentOptions? _companyPaymentOptions;
  CompanyPaymentOptions? get companyPaymentOptions => _companyPaymentOptions;
  set companyPaymentOptions(CompanyPaymentOptions? value) {
    _companyPaymentOptions = value;
    update();
  }

  Future<void> getCompanyPaymentOptions() async {
    isLoading = true;
    final businessId = Get.find<AppState>().user?.businessId;
    await PaymentOptionsApiService.getCompanyPaymentOptions(businessId: businessId).then((response) {
      response.fold(
        (companyPaymentOptions) {
          this.companyPaymentOptions = companyPaymentOptions;
        },
        (error) {
          Fluttertoast.showToast(msg: error);
        },
      );
    });
    isLoading = false;
  }
}
