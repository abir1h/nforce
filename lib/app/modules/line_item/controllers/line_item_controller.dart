import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/line_item/models/line_item_lookup_model.dart';
import 'package:nuforce/app/modules/line_item/services/line_item_data_repo.dart';

enum LineItemTab { lineItems, findItems, addNew }

class LineItemController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  LineItemTab _selectedTab = LineItemTab.lineItems;
  LineItemTab get selectedTab => _selectedTab;
  void setSelectedTab(LineItemTab tab) {
    _selectedTab = tab;
    update();
  }

  final List<LineItemLookupModel> _items = [];
  List<LineItemLookupModel> get items => _items;

  void addItem(LineItemLookupModel item) {
    _items.add(item);
    update();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    update();
  }

  Future<bool> addLineItem({
    required int workOrderId,
    required int invoiceId,
    required int lineItemId,
    required String lineItemFinder,
    required String unitCost,
    required String quantity,
    required String discount,
    required String description,
  }) async {
    bool isSuccessful = false;
    setLoading(true);
    await LineItemRepository()
        .addLineItem(
      workOrderId: workOrderId,
      invoiceId: invoiceId,
      lineItemId: lineItemId,
      lineItemFinder: lineItemFinder,
      unitCost: unitCost,
      quantity: quantity,
      discount: discount,
      description: description,
    )
        .then((value) {
      value.fold(
        (success) {
          Fluttertoast.showToast(msg: success);
          isSuccessful = true;
        },
        (error) {
          Fluttertoast.showToast(msg: error);
        },
      );
    });
    setLoading(false);
    return isSuccessful;
  }
}
