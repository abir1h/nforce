import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/service_items_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/landing_page_url_text_box.dart';
import 'package:nuforce/app/modules/service_items/widgets/overview_body.dart';
import 'package:nuforce/app/modules/service_items/widgets/selected_service_details_tab.dart';
import 'package:nuforce/app/modules/service_items/widgets/sub_items_body.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_with_switch.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
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
  bool _isLoadingPageUrlSelected = true;
  bool _isShareSelected = true;
  bool _isCommissionSelected = true;
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

  Widget settingsBody({
    required bool isLandingPageUrlSelected,
    required bool isShareSelected,
    required bool isCommissionSelected,
    required Function(bool) onLandingSwitchChanged,
    required Function(bool) onShareSwitchChanged,
    required Function(bool) onCommissionSwitchChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 23),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Landing Page URL',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 32.sp,
                height: 18.sp,
                child: FittedBox(
                  child: CupertinoSwitch(
                    applyTheme: true,
                    value: isLandingPageUrlSelected,
                    onChanged: onLandingSwitchChanged,
                    activeColor: AppColors.primaryBlue1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LandingPageUrlTextBox(
            controller: TextEditingController(),
          ),
          const SizedBox(height: 23),
          TitleWithSwitch(
            text: 'Share',
            isSwitchSelected: isShareSelected,
            onSwitchChanged: onShareSwitchChanged,
          ),
          const SizedBox(height: 23),
          TitleWithSwitch(
            text: 'Commission Tier',
            isSwitchSelected: isCommissionSelected,
            onSwitchChanged: onCommissionSwitchChanged,
          ),
          const SizedBox(height: 23),
          Text(
            'Regions',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          CustomDropdownButton(
            items: const [
              DropdownMenuItem(
                value: 'X',
                child: Text(
                  'X',
                ),
              ),
              DropdownMenuItem(
                value: 'Y',
                child: Text(
                  'Y',
                ),
              ),
              DropdownMenuItem(
                value: 'Z',
                child: Text(
                  'Z',
                ),
              ),
            ],
            hint: 'Select one',
            onChanged: (newVal) {},
            value: null,
          ),
          const SizedBox(height: 23),
          Text(
            'Preferred Agents',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          CustomDropdownButton(
            items: const [
              DropdownMenuItem(
                value: 'X',
                child: Text(
                  'X',
                ),
              ),
              DropdownMenuItem(
                value: 'Y',
                child: Text(
                  'Y',
                ),
              ),
              DropdownMenuItem(
                value: 'Z',
                child: Text(
                  'Z',
                ),
              ),
            ],
            hint: 'Select one',
            onChanged: (newVal) {},
            value: null,
          ),
        ],
      ),
    );
  }
}
