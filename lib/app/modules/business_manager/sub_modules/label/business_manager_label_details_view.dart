import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/label_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_add_or_edit_label.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_label_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dialog.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/main.dart';

class BusinessManagerLabelDeatilsView extends StatelessWidget {
  const BusinessManagerLabelDeatilsView({
    required this.label,
    super.key,
  });
  final Label label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: GetBuilder<BusinessManagerLabelController>(
        builder: (controller) {
          return CustomLoadingWidget(
            isLoading: controller.isLoading,
            child: SizedBox(
              height: height,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Name', subtitle: label.name ?? 'N/A'),
                    if (label.subType != null) ...[
                      const SizedBox(height: 16),
                      TitleSubtitleMinimal(
                        title: 'Type',
                        subtitle: label.subType!,
                      ),
                    ],
                    // const SizedBox(height: 16),
                    // TitleSubtitleMinimal(title: 'Description', subtitle: label.description ?? 'N/A'),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return CustomDialog(
                                    dialogType: DialogType.warning,
                                    title: 'Delete Label?',
                                    content: 'Are you sure you want to delete ${label.name ?? 'Label'}?',
                                    primaryText: 'Delete',
                                    onPrimaryButtonPress: () async {
                                      Navigator.of(ctx).pop();
                                      final controller = Get.find<BusinessManagerLabelController>();
                                      controller.saveEditOrDelete(action: ActionType.delete, id: label.id).then((value) {
                                        if (value) {
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
                            onPressed: () async {
                              final controller = Get.find<BusinessManagerLabelController>();
                              await controller.setLabelForm(label.id);
                              Get
                                ..back<void>()
                                ..to<void>(() => BusinessManagerAddOrEditLabel(label: label));
                            },
                            text: 'Edit',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
