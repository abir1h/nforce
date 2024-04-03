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

class AddNewLicenseView extends StatefulWidget {
  const AddNewLicenseView({super.key});

  @override
  State<AddNewLicenseView> createState() => _AddNewLicenseViewState();
}

class _AddNewLicenseViewState extends State<AddNewLicenseView> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Add New License',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
        child: Column(
          children: [
            const CustomTextField(
              label: 'License or Compliance Title',
              hint: 'License or Compliance Title',
              controller: null,
            ),
            16.h.vSpace,
            const CustomTextField(
              label: 'License or Compliance No',
              hint: 'License or Compliance No',
              controller: null,
            ),
            16.h.vSpace,
            CustomDateField(
              label: 'Date of Award',
              selectedDate: selectedDate != null ? DatetimeCustomFunc.getDashedDate(selectedDate!) : null,
              onChanged: (value) {
                setState(() {
                  selectedDate = value;
                });
              },
            ),
            16.h.vSpace,
            const CustomTextField(
              label: 'Details of Award',
              hint: 'Write details...',
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
