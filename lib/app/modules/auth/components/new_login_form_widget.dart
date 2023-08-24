import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';

class NewLoginFormWidget extends StatelessWidget {
  const NewLoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomTextField(
          label: 'Service ID',
          controller: null,
          hint: 'Enter your service id',
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          label: 'Email / Phone',
          controller: null,
          hint: 'Enter your email or phone',
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 30),
        PrimaryButton(
          onPressed: () {},
          text: 'Send magic link',
        ),
        const SizedBox(height: 14),
        PrimaryButton(
          onPressed: () {},
          text: 'Scan QR Code',
          primaryColored: false,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
