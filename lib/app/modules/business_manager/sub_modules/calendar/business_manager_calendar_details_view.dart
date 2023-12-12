import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_add_or_edit_calendar.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_calendar_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/main.dart';

class BusinessManagerCalendarDeatilsView extends StatelessWidget {
  const BusinessManagerCalendarDeatilsView({
    super.key,
    required this.calendar,
  });
  final MockCalendar calendar;

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
              TitleSubtitleMinimal(title: 'Name', subtitle: calendar.name),
              if (calendar.timeZone != null) const SizedBox(height: 16),
              if (calendar.timeZone != null) TitleSubtitleMinimal(title: 'Timezone', subtitle: calendar.timeZone!),
              if (calendar.color != null) const SizedBox(height: 16),
              if (calendar.color != null) TitleSubtitleMinimal(title: 'Color', subtitle: '${calendar.color?.red}${calendar.color?.green}${calendar.color?.blue}'),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Description', subtitle: calendar.description ?? 'N/A'),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back();
                        final controller = Get.find<BusinessManagerController>();
                        controller.businessManagerCalendarController.removeCalendar(calendar);
                        Fluttertoast.showToast(msg: 'Calendar Deleted');
                      },
                      text: 'Delete',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Get.back();
                        Get.to(() => BusinessManagerAddOrEditCalendar(calendar: calendar));
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
