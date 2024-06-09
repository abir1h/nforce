import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/views/selected_service_item_details_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/all_items_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/item_count_and_sort_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/material_item_card.dart';
import 'package:nuforce/app/modules/service_items/widgets/search_widget.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../controllers/service_items_controller.dart';

class MaterialItems extends StatelessWidget {
  const MaterialItems({super.key});

  @override
  Widget build(BuildContext context) {    final controller=Get.put(ServiceItemsController());

  return GetBuilder<ServiceItemsController>(builder: (controller) {
      return controller.dataLoaded == true
          ? Column(
              children: [
                const SearchWidget(),
                SizedBox(height: 20.sp),
                ItemCountAndSort(
                  items: controller.materialItems.length.toString(),
                ),
                const Divider(
                  color: AppColors.greyText,
                  thickness: 1,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.materialItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      RxBool isFavorite = false.obs;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: GestureDetector(
                          onTap: () {
                            Get.to<void>(() => const SelectedItemDetailsView(
                                appbarText: 'Broom and Dust Pan'));
                          },
                          child: Obx(
                            () => MaterialItemCard(
                              withBottomTitle: false,
                              isFavorite: isFavorite.value,
                              data: controller.materialItems[index],
                              onFavoriteTap: () {
                                isFavorite.value = !isFavorite.value;
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : const Loader();
    });
  }
}
