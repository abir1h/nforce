import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/business_manager_add_or_edit_contact_group.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/business_manager_contact_group_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/business_manager_contact_group_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/widget/business_manager_empty_contact_group.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/widget/colored_contact_group_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';

class BusinessManagerContactGroupView extends StatefulWidget {
  const BusinessManagerContactGroupView({super.key});

  @override
  State<BusinessManagerContactGroupView> createState() => _BusinessManagerContactGroupViewState();
}

class _BusinessManagerContactGroupViewState extends State<BusinessManagerContactGroupView> {
  // final controller = Get.find<BusinessManagerController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerContactGroupController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Contact Group',
            trailing: [
              if (controller.contactGroup?.data?.isEmpty ?? true)
                const SizedBox()
              else
                GestureDetector(
                  onTap: () async {
                    await controller.setContactGroupForm();
                    Get.to<void>(() => const BusinessManagerAddOrEditContactGroup());
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
            child: CustomLoadingWidget(
              isLoading: controller.isLoading,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: controller.contactGroup?.data?.isEmpty ?? true
                    ? const EmptyContactGroup()
                    : Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: ListView.builder(
                          itemCount: controller.contactGroup?.data?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final contactGroup = controller.contactGroup!.data![index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ColoredContactGroupTile(
                                contactGroup: contactGroup,
                                onTap: () {
                                  Get.to<void>(
                                    () => BusinessManagerContactGroupDeatilsView(
                                      contactGroup: contactGroup,
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
          ),
        );
      },
    );
  }
}
