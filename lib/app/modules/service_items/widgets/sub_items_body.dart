import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/service_items/widgets/service_manager_item_card.dart';

Widget subItemsBody() {
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (BuildContext context, int index) {
      return const ServiceManagerItemCard(withBottomTitle: false);
    },
  );
}
