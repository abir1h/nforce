import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class AddNewNoteView extends StatelessWidget {
  const AddNewNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Add New Note',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
        child: Column(
          children: [
            const CustomTextField(
              label: 'Note',
              hint: 'Wirte note...',
              controller: null,
              maxLines: 3,
            ),
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
