import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/views/contact_group/business_manager_add_or_edit_contact_group.dart';
import 'package:nuforce/app/modules/business_manager/views/contact_group/business_manager_contact_group_controller.dart';
import 'package:nuforce/app/modules/business_manager/views/contact_group/business_manager_contact_group_details_view.dart';
import 'package:nuforce/app/modules/business_manager/views/contact_group/widget/business_manager_empty_contact_group.dart';
import 'package:nuforce/app/modules/business_manager/views/contact_group/widget/colored_contact_group_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class BusinessManagerContactGroupView extends StatefulWidget {
  const BusinessManagerContactGroupView({super.key});

  @override
  State<BusinessManagerContactGroupView> createState() => _BusinessManagerContactGroupViewState();
}

class _BusinessManagerContactGroupViewState extends State<BusinessManagerContactGroupView> {
  final controller = Get.find<BusinessManagerController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerContactGroupController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Contact Group',
            trailing: [
              controller.contactGroupController.mockContactGroup.isEmpty
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        Get.to(() => const BusinessManagerAddOrEditContactGroup());
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
                          )
                        ],
                      ),
                    ),
              const SizedBox(width: 16)
            ],
          ),
          body: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: controller.contactGroupController.mockContactGroup.isEmpty
                  ? const EmptyContactGroup()
                  : Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: ListView.builder(
                        itemCount: controller.contactGroupController.mockContactGroup.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ColoredContactGroupTile(
                              contactGroup: controller.contactGroupController.mockContactGroup[index],
                              onTap: () {
                                Get.to(
                                  () => BusinessManagerContactGroupDeatilsView(
                                    contactGroup: controller.contactGroupController.mockContactGroup[index],
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
