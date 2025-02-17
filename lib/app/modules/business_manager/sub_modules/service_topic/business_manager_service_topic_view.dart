import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_topic_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_topic/business_manager_add_or_edit_service_topic.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_service_topic_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_topic/business_manager_service_topic_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_topic/widget/business_manager_empty_service_topic.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_topic/widget/service_topic_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class BusinessManagerServiceTopicView extends StatefulWidget {
  const BusinessManagerServiceTopicView({super.key});

  @override
  State<BusinessManagerServiceTopicView> createState() => _BusinessManagerServiceTopicViewState();
}

class _BusinessManagerServiceTopicViewState extends State<BusinessManagerServiceTopicView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerServiceTopicController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Service Topic',
            trailing: [
              if (controller.topicList.isEmpty)
                const SizedBox()
              else
                GestureDetector(
                  onTap: () {
                    final controller = Get.find<ServiceTopicEditController>();
                    controller.setTopicForm();
                    Get.to<void>(() => const BusinessManagerAddOrEditServiceTopic());
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
              child: controller.topicList.isEmpty
                  ? const EmptyServiceTopic()
                  : Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: ListView.builder(
                        itemCount: controller.topicList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ServiceTopicTile(
                              serviceTopic: controller.topicList[index],
                              onTap: () {
                                final editController = Get.find<ServiceTopicEditController>();
                                editController.setTopicForm(controller.topicList[index].id);
                                Get.to<void>(
                                  () => BusinessManagerServiceTopicDetailsView(
                                    serviceTopic: controller.topicList[index],
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
