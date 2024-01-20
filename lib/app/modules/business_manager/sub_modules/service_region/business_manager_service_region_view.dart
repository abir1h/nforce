import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_region/business_manager_add_or_edit_service_region.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_region/business_manager_service_region_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_region/business_manager_service_region_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_region/widget/business_manager_empty_service_region.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_region/widget/service_region_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class BusinessManagerServiceRegionView extends StatefulWidget {
  const BusinessManagerServiceRegionView({super.key});

  @override
  State<BusinessManagerServiceRegionView> createState() => _BusinessManagerServiceRegionViewState();
}

class _BusinessManagerServiceRegionViewState extends State<BusinessManagerServiceRegionView> {
  final controller = Get.find<BusinessManagerController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerServiceRegionController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Service Region',
            trailing: [
              if (controller.serviceRegionController.mockServiceRegion.isEmpty)
                const SizedBox()
              else
                GestureDetector(
                  onTap: () {
                    Get.to<void>(() => const BusinessManagerAddOrEditServiceRegion());
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, color: AppColors.primaryBlue1, size: 16.sp),
                      const SizedBox(width: 8),
                      Text(
                        'Add New',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(width: 16),
            ],
          ),
          body: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: controller.serviceRegionController.mockServiceRegion.isEmpty
                  ? const EmptyServiceRegion()
                  : Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: ListView.builder(
                        itemCount: controller.serviceRegionController.mockServiceRegion.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ServiceRegionTile(
                              serviceRegion: controller.serviceRegionController.mockServiceRegion[index],
                              onTap: () {
                                Get.to<void>(
                                  () => BusinessManagerServiceRegionDetailsView(
                                    serviceRegion: controller.serviceRegionController.mockServiceRegion[index],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}