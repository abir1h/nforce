import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/service_items/widgets/item_count_and_sort_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/search_widget.dart';
import 'package:nuforce/app/utils/colors.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/service_items_controller.dart';
import 'package:nuforce/app/modules/service_items/views/selected_service_item_details_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/service_manager_item_card.dart';

import 'all_items_widget.dart';

class ServiceItems extends StatefulWidget {
  const ServiceItems({
    super.key,
  });

  @override
  State<ServiceItems> createState() => _ServiceItemsState();
}

class _ServiceItemsState extends State<ServiceItems> {
  final controller = Get.put(ServiceItemsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceItemsController>(builder: (controller) {
      return controller.dataLoaded == true
          ? Column(
              children: [
                const SearchWidget(),
                SizedBox(height: 20.sp),
                ItemCountAndSort(
                  items: controller.serviceItems.length.toString(),
                ),
                const Divider(
                  color: AppColors.greyText,
                  thickness: 1,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.serviceItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      RxBool isFavorite = false.obs;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: GestureDetector(
                          onTap: () {
                            Get.to<void>(() => const SelectedItemDetailsView(appbarText: 'AC Hydrowash Service'));
                          },
                          child: Obx(
                            () => ServiceManagerItemCard(
                              withBottomTitle: index == 0,
                              isFavorite: isFavorite.value,
                              data: controller.serviceItems[index],
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
