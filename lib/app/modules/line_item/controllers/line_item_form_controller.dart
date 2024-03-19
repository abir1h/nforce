import 'dart:developer';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/line_item/models/line_item_controller_model.dart';
import 'package:nuforce/app/modules/line_item/services/line_item_data_repo.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';

class LineItemFormController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    setLineItemControllerModel().then((value) {
      formBuilder.controllers['unitCost']?.addListener(() {
        if (formBuilder.controllers['quantity']?.text != null && formBuilder.controllers['quantity']?.text.isNotEmpty == true && formBuilder.controllers['unitCost']?.text != null) {
          setTotalBill(
            double.parse('${formBuilder.controllers['quantity']?.text ?? 0}') * double.parse('${formBuilder.controllers['unitCost']?.text ?? 0}'),
          );
        }
      });
      formBuilder.controllers['quantity']?.addListener(() {
        if (formBuilder.controllers['quantity']?.text != null && formBuilder.controllers['unitCost']?.text != null && formBuilder.controllers['quantity']?.text.isNotEmpty == true) {
          setTotalBill(
            double.parse('${formBuilder.controllers['quantity']?.text ?? 0}') * double.parse('${formBuilder.controllers['unitCost']?.text ?? 0}'),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    formBuilder.controllers.forEach((key, value) {15
 
Mbps

      value.dispose();
    });
    super.dispose();
  }

  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    update();
  }

  CustomFormBuilder _formBuilder = CustomFormBuilder();
  CustomFormBuilder get formBuilder => _formBuilder;
  void setFormBuilder(CustomFormBuilder value) {
    _formBuilder = value;
    update();
  }

  double _totalBill = 0.00;
  double get totalBill => _totalBill;
  void setTotalBill(double value) {
    _totalBill = value;
    update();
  }

  LineItemControllerModel? _lineItemControllerModel;
  LineItemControllerModel? get lineItemControllerModel => _lineItemControllerModel;

  Future<void> setLineItemControllerModel() async {
    setLoading(true);
    await LineItemRepository().getLineItemControllerModel().then((value) {
      value.fold(
        (l) {
          _lineItemControllerModel = l;
          if (_lineItemControllerModel?.controls != null) {
            setFormBuilder(getForm(_lineItemControllerModel?.controls));
          }
          update();
        },
        (r) {
          log('LineItemRepository: $r');
        },
      );
    });
    setLoading(false);
  }
}
