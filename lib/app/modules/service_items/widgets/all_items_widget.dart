import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/service_items_controller.dart';
import 'package:nuforce/app/modules/service_items/views/selected_service_item_details_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/item_count_and_sort_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/search_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/service_manager_item_card.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class AllItems extends StatefulWidget {
  const AllItems({
    super.key,
  });

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
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
                  items: controller.allItems.length.toString(),
                ),
                Divider(
                  color: AppColors.greyText,
                  thickness: 1,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.allItems.length,
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
                              data: controller.allItems[index],
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

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      separatorBuilder: (_, index) {
        return SizedBox(
          height: 16.h,
        );
      },
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 10.w, right: 18.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.white3, width: 1.w),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          height: 94.h,
                          width: 94.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: .5.sw,
                              height: 12.0,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: .5.sw,
                              height: 12.0,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: .3.sw,
                              height: 12.0,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: .2.sw,
                              height: 12.0,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: .2.sw,
                              height: 12.0,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
      itemCount: 10,
      shrinkWrap: true,
    );
  }
}
