import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';

class EditFaqBottomSheetWidget extends StatefulWidget {
  const EditFaqBottomSheetWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.questionController,
    required this.answerController,
    this.onTap,
  });
  final String question;
  final String answer;
  final TextEditingController questionController;
  final TextEditingController answerController;
  final VoidCallback? onTap;

  @override
  State<EditFaqBottomSheetWidget> createState() => _EditFaqBottomSheetWidgetState();
}

class _EditFaqBottomSheetWidgetState extends State<EditFaqBottomSheetWidget> {
  @override
  void initState() {
    super.initState();
    widget.questionController.text = widget.question;
    widget.answerController.text = widget.answer;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding,
        vertical: AppSizes.horizontalPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            label: 'Question',
            hint: widget.question,
            controller: widget.questionController,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            label: 'Answer',
            hint: widget.answer,
            controller: widget.answerController,
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            onPressed: () {
              widget.onTap?.call();
              Navigator.pop(context);
            },
            text: 'Update',
          ),
        ],
      ),
    );
  }
}
