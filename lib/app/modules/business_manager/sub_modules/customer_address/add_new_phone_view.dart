import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_phone_input.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class AddNewPhoneNumberView extends StatelessWidget {
  const AddNewPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Add New Phone',
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
            const CustomPhoneInput(
              label: 'Phone',
              hint: 'Enter phone number',
              controller: null,
            ),
          ],
        ),
      ),
    );
  }
}
