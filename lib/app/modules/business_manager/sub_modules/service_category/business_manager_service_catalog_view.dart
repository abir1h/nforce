import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_add_or_edit_service_catalog.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_service_catalog_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_service_catalog_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/widget/business_manager_empty_service_catalog.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/widget/service_catalog_dropdown.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/widget/service_catalog_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class BusinessManagerServiceCatalogsView extends StatefulWidget {
  const BusinessManagerServiceCatalogsView({super.key});

  @override
  State<BusinessManagerServiceCatalogsView> createState() => _BusinessManagerServiceCatalogsViewState();
}

class _BusinessManagerServiceCatalogsViewState extends State<BusinessManagerServiceCatalogsView> {
  final controller = Get.find<BusinessManagerController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerServiceCatalogsController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Service Catalogs',
            trailing: [
              if (controller.serviceCatalogsController.categoryList.isEmpty)
                const SizedBox()
              else
                GestureDetector(
                  onTap: () {
                    Get.to<void>(() => const BusinessManagerAddOrEditServiceCatalogs());
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, color: AppColors.primaryBlue1, size: 16.sp),
                      const SizedBox(width: 4),
                      Text(
                        'Add',
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
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: controller.serviceCatalogsController.categoryList.isEmpty
                    ? const EmptyServiceCatalogs()
                    : Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Column(
                          children: [
                            const ServiceCalatogDropdown(),
                            const SizedBox(height: 16),
                            ListView.builder(
                              itemCount: controller.serviceCatalogsController.categoryList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: ServiceCatalogTile(
                                    service: controller.serviceCatalogsController.categoryList[index],
                                    onTap: () {
                                      Get.to<void>(
                                        () => BusinessManagerServiceCatalogsDeatilsView(
                                          serviceCategory: controller.serviceCatalogsController.categoryList[index],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
