import 'package:get/get.dart';
import 'package:nuforce/app/model/line_item_model.dart';

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

  final List<LineItem> _items = [];
  List<LineItem> get items => _items;

  void addItem(LineItem item) {
    _items.add(item);
    update();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    update();
  }
}
