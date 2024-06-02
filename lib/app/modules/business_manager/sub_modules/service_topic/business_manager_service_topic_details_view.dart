import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/service_topic_model.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Name', subtitle: serviceTopic.name),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Group Code', subtitle: serviceTopic.groupCode ?? 'N/A'),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Group Type', subtitle: serviceTopic.groupType ?? 'N/A'),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back<void>();
                      /*  final controller = Get.find<BusinessManagerController>();
                        controller.serviceTopicController.removeServiceTopic(serviceTopic);
                        Fluttertoast.showToast(msg: 'Service topic Deleted');*/
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
