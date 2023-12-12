import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_add_or_edit_label.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_label_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/main.dart';

class BusinessManagerLabelDeatilsView extends StatelessWidget {
  const BusinessManagerLabelDeatilsView({
    super.key,
    required this.label,
  });
  final MockLabel label;

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
              TitleSubtitleMinimal(title: 'Name', subtitle: label.name),
              if (label.type != null) const SizedBox(height: 16),
              if (label.type != null) TitleSubtitleMinimal(title: 'Type', subtitle: label.type!),
              if (label.color != null) const SizedBox(height: 16),
              if (label.color != null) TitleSubtitleMinimal(title: 'Color', subtitle: '${label.color?.red}${label.color?.green}${label.color?.blue}'),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Description', subtitle: label.description ?? 'N/A'),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back();
                        final controller = Get.find<BusinessManagerController>();
                        controller.labelController.removeLabel(label);
                        Fluttertoast.showToast(msg: 'Label Deleted');
                      },
                      text: 'Delete',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Get.back();
                        Get.to(() => BusinessManagerAddOrEditLabel(label: label));
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
