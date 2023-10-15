import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/service_items_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/little_text_with_colored_bg.dart';
import 'package:nuforce/app/modules/service_items/widgets/overview_body.dart';
import 'package:nuforce/app/modules/service_items/widgets/rating_tile.dart';
import 'package:nuforce/app/modules/service_items/widgets/selected_service_details_tab.dart';
import 'package:nuforce/app/modules/service_items/widgets/service_manager_item_card.dart';
import 'package:nuforce/app/modules/service_items/widgets/sub_items_body.dart';
import 'package:nuforce/app/modules/service_items/widgets/total_reviwe_card.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class SelectedServiceItemDetailsView extends StatefulWidget {
  const SelectedServiceItemDetailsView({super.key});

  @override
  State<SelectedServiceItemDetailsView> createState() => _SelectedServiceItemDetailsViewState();
}

class _SelectedServiceItemDetailsViewState extends State<SelectedServiceItemDetailsView> {
  final ServiceItemsController controller = Get.put(ServiceItemsController());
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'AC Hydrowash Service',
        centerTitle: false,
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectedServiceDetailsTabs(controller: controller),
            Expanded(
              child: Obx(
                () => controller.selectedServiceTabEnum.value == SelectedServiceTabEnum.overview
                    ? overviewBody(
                        isFavorite: _isFavorite,
                        onTapFavorite: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                      )
                    : controller.selectedServiceTabEnum.value == SelectedServiceTabEnum.subItems
                        ? subItemsBody()
                        : controller.selectedServiceTabEnum.value == SelectedServiceTabEnum.settings
                            ? const SizedBox()
                            : controller.selectedServiceTabEnum.value == SelectedServiceTabEnum.content
                                ? const SizedBox()
                                : Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: Obx(
                () => controller.selectedServiceTabEnum.value == SelectedServiceTabEnum.settings
                    ? PrimaryButton(onPressed: () {}, text: 'Update')
                    : Row(
                        children: [
                          Expanded(child: SecondaryButton(onPressed: () {}, text: 'Delete')),
                          const SizedBox(width: 15),
                          Expanded(child: PrimaryButton(onPressed: () {}, text: 'Edit')),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
