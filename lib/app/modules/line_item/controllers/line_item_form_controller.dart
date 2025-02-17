import 'dart:developer';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/line_item/models/line_item_controller_model.dart';
import 'package:nuforce/app/modules/line_item/services/line_item_data_repo.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';

class LineItemFormController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    setLineItemControllerModel().then((value) {
      formBuilder.textEditingControllers['unitCost']?.addListener(() {
        if (formBuilder.textEditingControllers['quantity']?.text != null &&
            formBuilder.textEditingControllers['quantity']?.text.isNotEmpty == true &&
            formBuilder.textEditingControllers['unitCost']?.text != null) {
          setTotalBill(
            double.parse('${formBuilder.textEditingControllers['quantity']?.text ?? 0}') * double.parse('${formBuilder.textEditingControllers['unitCost']?.text ?? 0}'),
          );
        }
      });
      formBuilder.textEditingControllers['quantity']?.addListener(() {
        if (formBuilder.textEditingControllers['quantity']?.text != null &&
            formBuilder.textEditingControllers['unitCost']?.text != null &&
            formBuilder.textEditingControllers['quantity']?.text.isNotEmpty == true) {
          setTotalBill(
            double.parse('${formBuilder.textEditingControllers['quantity']?.text ?? 0}') * double.parse('${formBuilder.textEditingControllers['unitCost']?.text ?? 0}'),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    formBuilder.textEditingControllers.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool _formLoading = false;
  bool get formLoading => _formLoading;
  void setFormLoading(bool value) {
    _formLoading = value;
    update();
  }

  CustomFormBuilder _formBuilder = CustomFormBuilder();
  CustomFormBuilder get formBuilder => _formBuilder;
  void setFormBuilder(CustomFormBuilder value) {
    _formBuilder = value;
    update();
  }

  void updateOnChanged(String name, Option? value) {
    _formBuilder.dropdownValue[name] = value;
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
            setFormBuilder(getForm(controls: _lineItemControllerModel?.controls));
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
