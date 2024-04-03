import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_date_field.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/datetime_custom_func.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class AddNewEventView extends StatefulWidget {
  const AddNewEventView({super.key});

  @override
  State<AddNewEventView> createState() => _AddNewEventViewState();
}

class _AddNewEventViewState extends State<AddNewEventView> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Add New Event',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
        child: Column(
          children: [
            const CustomTextField(
              label: 'Title',
              hint: 'Enter title',
              controller: null,
            ),
            16.h.vSpace,
            CustomDateField(
              label: 'Date',
              selectedDate: selectedDate != null ? DatetimeCustomFunc.getDashedDate(selectedDate!) : null,
              onChanged: (value) {
                setState(() {
                  selectedDate = value;
                });
              },
            ),
            16.h.vSpace,
            const CustomTextField(
              label: 'Description',
              hint: 'Write description...',
              controller: null,
              maxLines: 3,
            ),
            16.h.vSpace,
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SecondaryButton(
                    onPressed: () {},
                    text: 'Reset',
                  ),
                ),
                10.w.hSpace,
                Expanded(
                  child: PrimaryButton(
                    onPressed: () {},
                    text: 'Save',
                  ),
                ),
              ],
            ),
            20.h.vSpace,
          ],
        ),
      ),
    );
  }
}
