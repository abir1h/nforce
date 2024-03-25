import 'dart:developer';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/line_item/models/line_item_lookup_model.dart';
import 'package:nuforce/app/modules/line_item/services/line_item_data_repo.dart';

class LineItemLookupController extends GetxController {
  final List<LineItemLookupModel> _searchResult = <LineItemLookupModel>[];
  List<LineItemLookupModel> get searchResult => _searchResult;

  void addLineItemLookupModel(List<LineItemLookupModel> value) {
    _searchResult.clear();
    _searchResult.addAll(value);
    update();
  }

  void clearSearchResult() {
    _searchResult.clear();
    update();
  }

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    update();
  }

  bool _showSearchResult = false;
  bool get showSearchResult => _showSearchResult;

  void setShowSearchResult(bool value) {
    _showSearchResult = value;
    log('showSearchResult: $value', name: 'LineItemLookupController');
    update();
  }

  Future<void> lookup(String query) async {
    setLoading(true);
    await LineItemRepository().lookupLineItem(query).then((value) {
      value.fold(
        (lineItemLookup) {
          setShowSearchResult(true);
          addLineItemLookupModel(lineItemLookup);
        },
        (r) {
          log('Error: $r', name: 'LineItemLookupController');
          clearSearchResult();
          setShowSearchResult(false);
        },
      );
    });
    setLoading(false);
  }
}
