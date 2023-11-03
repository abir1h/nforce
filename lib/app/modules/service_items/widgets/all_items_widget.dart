import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/views/selected_service_item_details_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/item_count_and_sort_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/search_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/service_manager_item_card.dart';
import 'package:nuforce/app/utils/colors.dart';

class AllItems extends StatelessWidget {
  const AllItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchWidget(),
        SizedBox(height: 20.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: const ItemCountAndSort(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(color: AppColors.greyText),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              RxBool isFavorite = false.obs;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const SelectedItemDetailsView(appbarText: 'AC Hydrowash Service'));
                  },
                  child: Obx(
                    () => ServiceManagerItemCard(
                      withBottomTitle: index == 0,
                      isFavorite: isFavorite.value,
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
    );
  }
}
