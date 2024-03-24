import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../shared/widgets/custom_text_field.dart';
import '../../../../../shared/widgets/custom_dropdown.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';
import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';

class AddTermsPolicyScreen extends StatefulWidget {
  const AddTermsPolicyScreen({super.key});

  @override
  State<AddTermsPolicyScreen> createState() => _AddTermsPolicyScreenState();
}

class _AddTermsPolicyScreenState extends State<AddTermsPolicyScreen> {
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
      resizeToAvoidBottomInset: true,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: () =>Get.back(),
                text: 'Reset',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: PrimaryButton(
                onPressed: () =>Get.back(),
                text: 'Submit',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: const CustomAppbarMinimal(
        title: 'Create New Terms & Policy',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: 'Policy Name',
              hint: 'Enter policy name',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Policy Type',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomDropdownButton(
              items: const [
                DropdownMenuItem(
                  value: 'X',
                  child: Text(
                    'Quotation Terms',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Y',
                  child: Text(
                    'Terms of Service',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Z',
                  child: Text(
                    'Service Policy',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Z',
                  child: Text(
                    'Disclaimer',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Z',
                  child: Text(
                    'Disclaimer',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Z',
                  child: Text(
                    'Copyright Disclosure ',
                  ),
                ),
              ],
              hint: 'Select one',
              onChanged: (newVal) {},
              value: null,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              label: 'Describe Why This Policy',
              hint: 'Understanding the importance of Terms',
              maxLines: 3,
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              label: 'Instructions',
              hint: 'Enter policy name',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Make this policy available to new proposals?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              height: 32.sp,
              width: 32.sp,
              child: FittedBox(
                child: CupertinoSwitch(
                  applyTheme: true,
                  value: true,
                  onChanged: (v) {},
                  activeColor: AppColors.primaryBlue1,
                ),
              ),
            ), SizedBox(
              height: 16.h,
            ),
            Text(
              'Write Policy',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),      Container(
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
