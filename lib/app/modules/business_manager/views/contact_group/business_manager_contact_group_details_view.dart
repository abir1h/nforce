import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/views/contact_group/business_manager_add_or_edit_contact_group.dart';
import 'package:nuforce/app/modules/business_manager/views/contact_group/business_manager_contact_group_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/main.dart';

class BusinessManagerContactGroupDeatilsView extends StatelessWidget {
  const BusinessManagerContactGroupDeatilsView({
    super.key,
    required this.contactGroup,
  });
  final MockContactGroup contactGroup;

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
              TitleSubtitleMinimal(title: 'Name', subtitle: contactGroup.name),
              if (contactGroup.for_ != null) const SizedBox(height: 16),
              if (contactGroup.for_ != null) TitleSubtitleMinimal(title: 'Type', subtitle: contactGroup.for_!),
              if (contactGroup.color != null) const SizedBox(height: 16),
              if (contactGroup.color != null) TitleSubtitleMinimal(title: 'Color', subtitle: '${contactGroup.color?.red}${contactGroup.color?.green}${contactGroup.color?.blue}'),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Description', subtitle: contactGroup.description ?? 'N/A'),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back();
                        final controller = Get.find<BusinessManagerController>();
                        controller.contactGroupController.removeContactGroup(contactGroup);
                        Fluttertoast.showToast(msg: 'Contact Group Deleted');
                      },
                      text: 'Delete',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Get.back();
                        Get.to(() => BusinessManagerAddOrEditContactGroup(contactGroup: contactGroup));
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
