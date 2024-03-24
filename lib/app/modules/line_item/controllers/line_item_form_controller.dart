import 'dart:developer';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart' as ctrl;
import 'package:nuforce/app/modules/line_item/models/line_item_controller_model.dart';
import 'package:nuforce/app/modules/line_item/services/line_item_data_repo.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';
import 'dart:developer' as developer show log;

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

  void updateOnChanged(String name, ctrl.Option? value) {
    developer.log('Previous value: ${formBuilder.dropdownValue[name]?.label}');
    _formBuilder.dropdownValue[name] = value;
    developer.log('Dropdown value: ${formBuilder.dropdownValue[name]?.label}');
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
