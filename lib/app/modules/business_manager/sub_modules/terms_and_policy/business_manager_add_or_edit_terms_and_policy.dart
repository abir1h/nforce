import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/terms_and_policy/business_manager_terms_and_policy_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

GlobalKey<FormState> addOrEditTermsAndPolicy = GlobalKey<FormState>();

class BusinessManagerAddOrEditTermsAndPolicy extends StatefulWidget {
  const BusinessManagerAddOrEditTermsAndPolicy({
    super.key,
    this.termsAndPolicy,
  });
  final MockTermsAndPolicy? termsAndPolicy;

  @override
  State<BusinessManagerAddOrEditTermsAndPolicy> createState() => _BusinessManagerAddOrEditTermsAndPolicyViewState();
}

class _BusinessManagerAddOrEditTermsAndPolicyViewState extends State<BusinessManagerAddOrEditTermsAndPolicy> {
  String? policyType;
  bool availableToNewProposals = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController briefDescriptionController = TextEditingController();
  TextEditingController instructionController = TextEditingController();
  final QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    if (widget.termsAndPolicy != null) {
      final termsAndPolicy = widget.termsAndPolicy!;
      nameController.text = termsAndPolicy.policyName;
      briefDescriptionController.text = termsAndPolicy.briefDescription;
      instructionController.text = termsAndPolicy.instructions;
      policyType = termsAndPolicy.policyType;
      availableToNewProposals = termsAndPolicy.availableToNewProposals;
      _controller.document = Document.fromJson(jsonDecode(termsAndPolicy.policy) as List<dynamic>);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    briefDescriptionController.dispose();
    instructionController.dispose();
    _controller.dispose();
    policyType = '';
    availableToNewProposals = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.termsAndPolicy != null ? 'Edit Terms And Policy' : 'Add Terms And Policy',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: Form(
          key: addOrEditTermsAndPolicy,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                CustomTextField(
                  label: 'Policy Name',
                  hint: 'Enter policy name',
                  controller: nameController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Policy name can not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomDropdownButton(
                  label: 'Policy Type',
                  items: ['Quotation terms', 'Terms of Service', 'Service Policy', 'Disclaimer', 'Insurance Policy', 'Copyrigth Policy'].map((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.nutralBlack1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                  hint: 'Policy Type',
                  onChanged: (newV) {
                    setState(() {
                      policyType = newV as String;
                    });
                  },
                  value: policyType,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Describe Why This Policy',
                  hint: 'Enter brief description',
                  controller: briefDescriptionController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Instructions',
                  hint: 'Enter instructions',
                  controller: instructionController,
                ),
                const SizedBox(height: 16),
                Text(
                  'Make this policy available to new proposals?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Switch.adaptive(
                  value: availableToNewProposals,
                  onChanged: (v) {
                    setState(() {
                      availableToNewProposals = v;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Write Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width,
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
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        onPressed: () {
                          if (widget.termsAndPolicy == null) {
                            nameController.clear();
                            briefDescriptionController.clear();
                            instructionController.clear();
                            setState(() {
                              _controller.document = Document.fromJson([jsonDecode('{"ops":[{"insert":"\n"}]}')]);
                              policyType = '';
                              availableToNewProposals = false;
                            });
                          } else {
                            final termsAndPolicy = widget.termsAndPolicy!;
                            nameController.text = termsAndPolicy.policyName;
                            briefDescriptionController.text = termsAndPolicy.briefDescription;
                            instructionController.text = termsAndPolicy.instructions;
                            setState(() {
                              _controller.document = Document.fromJson(jsonDecode(termsAndPolicy.policy) as List<dynamic>);
                              policyType = termsAndPolicy.policyType;
                              availableToNewProposals = termsAndPolicy.availableToNewProposals;
                            });
                          }
                        },
                        text: 'Reset',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () {
                          if (!addOrEditTermsAndPolicy.currentState!.validate()) {
                            return;
                          }

                          if (policyType == null) {
                            Fluttertoast.showToast(msg: 'Please select policy type');
                            return;
                          }

                          final controller = Get.find<BusinessManagerController>();

                          if (widget.termsAndPolicy != null) {
                            controller.termsAndPolicyController.updateTermsAndPolicy(
                              MockTermsAndPolicy(
                                id: widget.termsAndPolicy!.id,
                                policyName: nameController.text,
                                policyType: policyType!,
                                briefDescription: briefDescriptionController.text,
                                instructions: instructionController.text,
                                availableToNewProposals: availableToNewProposals,
                                policy: jsonEncode(_controller.document.toDelta().toJson()),
                              ),
                            );
                          } else {
                            controller.termsAndPolicyController.addTermsAndPolicy(
                              MockTermsAndPolicy(
                                id: DateTime.now().millisecondsSinceEpoch.toString(),
                                policyName: nameController.text,
                                policyType: policyType!,
                                briefDescription: briefDescriptionController.text,
                                instructions: instructionController.text,
                                availableToNewProposals: availableToNewProposals,
                                policy: jsonEncode(_controller.document.toDelta().toJson()),
                              ),
                            );
                          }
                          Get.back<void>();
                        },
                        text: widget.termsAndPolicy != null ? 'Update' : 'Submit',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
