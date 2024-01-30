import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/modules/business_manager/widgets/image_upload_optional.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';

import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class BusinessManagerProfileView extends StatefulWidget {
  const BusinessManagerProfileView({super.key});

  @override
  State<BusinessManagerProfileView> createState() => _BusinessManagerProfileViewState();
}

class _BusinessManagerProfileViewState extends State<BusinessManagerProfileView> {
  String? businessType;
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
          child: Column(
            children: [
              ImageUploadOptional(
                image: image,
                onImageRemoveButtonTap: () {
                  setState(() {
                    image = null;
                  });
                },
                ontap: () async {
                  image = await pickImage(ImageSource.gallery);
                  setState(() {});
                },
              ),
              const SizedBox(height: 25),
              const CustomTextField(
                label: 'Display name',
                hint: 'Enter display name',
                controller: null,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Brand Tagline',
                hint: 'Enter brand tagline',
                controller: null,
              ),
              const SizedBox(height: 16),
              CustomDropdownButton(
                label: 'Business Type',
                hint: 'Select one',
                onChanged: (p0) {
                  setState(() {
                    businessType = p0 as String?;
                  });
                },
                value: businessType,
                items: ['Type1', 'Type2', 'Type3']
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.nutralBlack1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'About Your Business',
                hint: 'Write about your business',
                maxLines: 3,
                controller: null,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Office Address',
                hint: 'Enter office address',
                controller: null,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Phone',
                hint: 'Enter phone number',
                controller: null,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Email',
                hint: 'Enter email address',
                controller: null,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Support',
                hint: 'Enter support',
                controller: null,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Website',
                hint: 'Enter website link',
                controller: null,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Twitter Handle',
                hint: 'Enter twitter handle',
                controller: null,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Facebook Page',
                hint: 'Enter facebook page link',
                controller: null,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {},
                      text: 'Reset',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {},
                      text: 'Submit',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
