import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_add_or_edit_service_category.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_service_category_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_service_category_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/widget/business_manager_empty_service_category.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/widget/service_category_dropdown.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/widget/service_category_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class BusinessManagerServiceCategoryView extends StatefulWidget {
  const BusinessManagerServiceCategoryView({super.key});

  @override
  State<BusinessManagerServiceCategoryView> createState() => _BusinessManagerServiceCategoryViewState();
}

class _BusinessManagerServiceCategoryViewState extends State<BusinessManagerServiceCategoryView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerServiceCategoryController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Service Categories',
            trailing: [
              if (controller.categoryList.isEmpty)
                const SizedBox()
              else
                GestureDetector(
                  onTap: () {
                    Get.to<void>(() => const BusinessManagerAddOrEditServiceCategory());
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
          body: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: controller.categoryList.isEmpty
                  ? const EmptyServiceCatagory()
                  : Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const ServiceCalegoryDropdown(),
                            const SizedBox(height: 16),
                            ListView.builder(
                              itemCount: controller.categoryList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: ServiceCategoryTile(
                                    service: controller.categoryList[index],
                                    onTap: () {
                                      Get.to<void>(
                                        () => BusinessManagerServiceCategoryDeatilsView(
                                          serviceCategory: controller.categoryList[index],
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
