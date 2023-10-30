import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/widgets/material_item_card.dart';

class MaterialItems extends StatelessWidget {
  const MaterialItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        RxBool isFavorite = false.obs;
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: GestureDetector(
            onTap: () {},
            child: Obx(
              () => MaterialItemCard(
                withBottomTitle: false,
                isFavorite: isFavorite.value,
                onFavoriteTap: () {
                  isFavorite.value = !isFavorite.value;
                },
              ),
            ),
          ),
        );
      },
    );
  }
}