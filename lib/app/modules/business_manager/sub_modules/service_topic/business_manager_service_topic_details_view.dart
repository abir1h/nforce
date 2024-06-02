import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_topic_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/service_topic_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dialog.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/main.dart';

import 'business_manager_add_or_edit_service_topic.dart';

class BusinessManagerServiceTopicDetailsView extends StatelessWidget {
  const BusinessManagerServiceTopicDetailsView({
    required this.serviceTopic,
    super.key,
  });
  final ServiceTopicModel serviceTopic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: GetBuilder<ServiceTopicEditController>(
            builder: (controller) {
              return CustomLoadingWidget(
                isLoading: controller.isLoading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Name', subtitle: serviceTopic.name),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Group Code', subtitle: serviceTopic.groupCode),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Group Type', subtitle: serviceTopic.groupType),
                    const SizedBox(height: 32),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return CustomDialog(
                                    dialogType: DialogType.warning,
                                    title: 'Delete Service Topic?',
                                    content: 'Are you sure you want to delete ${serviceTopic.name}?',
                                    primaryText: 'Delete',
                                    onPrimaryButtonPress: () async {
                                      Navigator.of(ctx).pop();
                                      final controller = Get.find<ServiceTopicEditController>();
                                      controller.addEditDeleteTopic(action: ActionType.delete, id: serviceTopic.id).then((value) {
                                        if (value ?? false) {
                                          Get.back<void>();
                                        }
                                      });
                                    },
                                    secondaryText: 'Cancel',
                                    onSecondaryButtonPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                  );
                                },
                              );
                            },
                            text: 'Delete',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () {
                              Get
                                ..back<void>()
                                ..to<void>(() => BusinessManagerAddOrEditServiceTopic(serviceTopic: serviceTopic));
                            },
                            text: 'Edit',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
