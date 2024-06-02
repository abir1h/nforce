import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/calendar_list_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_add_or_edit_calendar.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_calendar_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dialog.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/main.dart';

class BusinessManagerCalendarDetailsView extends StatelessWidget {
  const BusinessManagerCalendarDetailsView({
    required this.calendar,
    super.key,
  });
  final CalendarData calendar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SizedBox(
        height: height,
        width: width,
        child: GetBuilder<BusinessManagerCalendarController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: CustomLoadingWidget(
                isLoading: controller.isLoading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Name', subtitle: calendar.name ?? ''),
                    if (calendar.timezone != null) ...[
                      const SizedBox(height: 16),
                      TitleSubtitleMinimal(title: 'Timezone', subtitle: calendar.timezone!),
                    ],
                    // if (calendar.color != null) const SizedBox(height: 16),
                    // if (calendar.color != null) TitleSubtitleMinimal(title: 'Color', subtitle: '${calendar.color?.red}${calendar.color?.green}${calendar.color?.blue}'),
                    // const SizedBox(height: 16),
                    // TitleSubtitleMinimal(title: 'Description', subtitle: calendar.description ?? 'N/A'),
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
                                    title: 'Delete Calendar?',
                                    content: 'Are you sure you want to delete ${calendar.name ?? 'Calendar'}?',
                                    primaryText: 'Delete',
                                    onPrimaryButtonPress: () async {
                                      Navigator.of(ctx).pop();
                                      controller.saveEditOrDelete(calendarId: calendar.id, action: ActionType.delete).then((value) {
                                        if (value) {
                                          Get.back<void>();
                                          Fluttertoast.showToast(msg: 'Calendar deleted successfully.');
                                        } else {
                                          Fluttertoast.showToast(msg: 'Error occurred while deleting calendar.');
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
                              await controller.setContactForm(calendar.id);
                              Get
                                ..back<void>()
                                ..to<void>(() => BusinessManagerAddOrEditCalendar(calendar: calendar));
                            },
                            text: 'Edit',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
