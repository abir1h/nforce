import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_add_or_edit_label.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_label_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_label_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/widget/business_manager_empty_label.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/widget/colored_label_task_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';

class BusinessManagerLabelView extends StatefulWidget {
  const BusinessManagerLabelView({super.key});

  @override
  State<BusinessManagerLabelView> createState() => _BusinessManagerLabelViewState();
}

class _BusinessManagerLabelViewState extends State<BusinessManagerLabelView> {
  // final controller = Get.find<BusinessManagerController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerLabelController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Label',
            trailing: [
              if (controller.labelData?.data?.isEmpty ?? true)
                const SizedBox()
              else
                GestureDetector(
                  onTap: () async {
                    final controller = Get.find<BusinessManagerLabelController>();
                    await controller.setLabelForm();
                    Get.to<void>(() => const BusinessManagerAddOrEditLabel());
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
          body: CustomLoadingWidget(
            isLoading: controller.isLoading,
            child: SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: controller.labelData?.data?.isEmpty ?? true
                    ? const EmptyLabel()
                    : Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: ListView.builder(
                          itemCount: controller.labelData?.data?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final label = controller.labelData!.data![index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ColoredLabelTile(
                                label: label,
                                onTap: () async {
                                  Get.to<void>(
                                    () => BusinessManagerLabelDeatilsView(label: label),
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
