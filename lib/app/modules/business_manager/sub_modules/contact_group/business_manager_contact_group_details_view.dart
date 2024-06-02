import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/contact_group_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/business_manager_add_or_edit_contact_group.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/business_manager_contact_group_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/main.dart';

class BusinessManagerContactGroupDeatilsView extends StatelessWidget {
  const BusinessManagerContactGroupDeatilsView({
    required this.contactGroup,
    super.key,
  });
  final ContactGroup? contactGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: GetBuilder<BusinessManagerContactGroupController>(
            builder: (controller) {
              return CustomLoadingWidget(
                isLoading: controller.isLoading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Name', subtitle: contactGroup?.name ?? 'N/A'),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () async {
                              final controller = Get.find<BusinessManagerContactGroupController>();
                              await controller.saveEditOrDelete(action: ActionType.delete, id: contactGroup?.id).then((value) {
                                if (value) {
                                  Get.back<void>();
                                  Fluttertoast.showToast(msg: 'Contact Group Deleted');
                                }
                              });
                            },
                            text: 'Delete',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () async {
                              final controller = Get.find<BusinessManagerContactGroupController>();
                              await controller.setContactGroupForm(contactGroup?.id);
                              Get
                                ..back<void>()
                                ..to<void>(() => BusinessManagerAddOrEditContactGroup(contactGroup: contactGroup));
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
