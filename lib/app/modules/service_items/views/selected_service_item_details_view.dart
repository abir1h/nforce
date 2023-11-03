import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/service_items_controller.dart';
import 'package:nuforce/app/modules/service_items/views/add_new_service_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/content_body.dart';
import 'package:nuforce/app/modules/service_items/widgets/overview_body.dart';
import 'package:nuforce/app/modules/service_items/widgets/selected_service_details_tab.dart';
import 'package:nuforce/app/modules/service_items/widgets/settings_body.dart';
import 'package:nuforce/app/modules/service_items/widgets/sub_items_body.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class SelectedItemDetailsView extends StatefulWidget {
  const SelectedItemDetailsView({super.key, required this.appbarText});
  final String appbarText;

  @override
  State<SelectedItemDetailsView> createState() => _SelectedItemDetailsViewState();
}

class _SelectedItemDetailsViewState extends State<SelectedItemDetailsView> {
  final ServiceItemsController controller = Get.put(ServiceItemsController());
  bool _isFavorite = false;
  bool _isLoadingPageUrlSelected = true;
  bool _isShareSelected = true;
  bool _isCommissionSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: CustomAppbarMinimal(
        title: widget.appbarText,
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
                            ? settingsBody(
                                isCommissionSelected: _isCommissionSelected,
                                isLandingPageUrlSelected: _isLoadingPageUrlSelected,
                                isShareSelected: _isShareSelected,
                                onCommissionSwitchChanged: (newVal) {
                                  setState(() {
                                    _isCommissionSelected = newVal;
                                  });
                                },
                                onLandingSwitchChanged: (newVal) {
                                  setState(() {
                                    _isLoadingPageUrlSelected = newVal;
                                  });
                                },
                                onShareSwitchChanged: (newVal) {
                                  setState(() {
                                    _isShareSelected = newVal;
                                  });
                                },
                              )
                            : controller.selectedServiceTabEnum.value == SelectedServiceTabEnum.content
                                ? contentBody()
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
                          Expanded(
                            child: PrimaryButton(
                              onPressed: () {
                                Get.to(const AddNewServiceView());
                              },
                              text: 'Edit',
                            ),
                          ),
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
