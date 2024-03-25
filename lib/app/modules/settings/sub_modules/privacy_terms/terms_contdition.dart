import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/secondary_button.dart';

class TermsCondtionScreen extends StatefulWidget {
  const TermsCondtionScreen({super.key});

  @override
  State<TermsCondtionScreen> createState() => _TermsCondtionScreenState();
}

class _TermsCondtionScreenState extends State<TermsCondtionScreen> {
  final QuillController _controller = QuillController.basic();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppbarMinimal(
        title: 'Terms & Conditions',
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: () => Get.back(),
                text: 'Reset',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: PrimaryButton(
                onPressed: () => Get.back(),
                text: 'Submit',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                color: AppColors.tileBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                border: Border.all(
                  color: AppColors.inactiveColor,
                ),
              ),
              child: QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
                  controller: _controller,
                  showUndo: false,
                  showRedo: false,
                  showFontFamily: false,
                  showBackgroundColorButton: false,
                  showSuperscript: false,
                  showSubscript: false,
                  showColorButton: false,
                  showSearchButton: false,
                  showInlineCode: false,
                  showClearFormat: false,
                  showFontSize: false,
                  showListCheck: false,
                  showIndent: false,
                  showQuote: false,
                  showUnderLineButton: false,
                  showCodeBlock: false,
                  toolbarIconAlignment: WrapAlignment.start,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('en'),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.white1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.inactiveColor,
                  ),
                  left: BorderSide(
                    color: AppColors.inactiveColor,
                  ),
                  right: BorderSide(
                    color: AppColors.inactiveColor,
                  ),
                ),
              ),
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: _controller,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('en'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
