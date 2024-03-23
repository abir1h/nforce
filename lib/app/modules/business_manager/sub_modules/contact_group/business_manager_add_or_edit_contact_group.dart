import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/business_manager_contact_group_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_color_picker.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

GlobalKey<FormState> addOrEditContactGroup = GlobalKey<FormState>();

class BusinessManagerAddOrEditContactGroup extends StatefulWidget {
  const BusinessManagerAddOrEditContactGroup({
    super.key,
    this.contactGroup,
  });
  final MockContactGroup? contactGroup;

  @override
  State<BusinessManagerAddOrEditContactGroup> createState() => _BusinessManagerAddOrEditCalendarViewState();
}

class _BusinessManagerAddOrEditCalendarViewState extends State<BusinessManagerAddOrEditContactGroup> {
  String? name;
  String? for_;
  String? color;
  String? description;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.contactGroup != null) {
      final contactGroup = widget.contactGroup!;
      nameController.text = contactGroup.name;
      descriptionController.text = contactGroup.description ?? '';
      for_ = contactGroup.for_;
      color = contactGroup.color?.value.toString();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.contactGroup != null ? 'Edit Contact Group' : 'Add Contact Group',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: Form(
          key: addOrEditContactGroup,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              CustomTextField(
                label: 'Name*',
                hint: 'Enter Group name',
                controller: nameController,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter group name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomDropdownButton(
                label: 'For',
                items: ['Primary Group', 'Secondary Group', 'Family', 'Friends', 'Others']
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
                hint: 'Select one',
                onChanged: (v) {
                  setState(() {
                    for_ = v as String?;
                  });
                },
                value: for_,
              ),
              const SizedBox(height: 16),
              CustomColorPicker(
                label: 'Color',
                pickerColor: color != null ? Color(int.parse(color!)) : AppColors.primaryBlue1,
                onColorChanged: (p0) {
                  setState(() {
                    color = p0.value.toString();
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Description',
                hint: 'Enter description',
                maxLines: 3,
                controller: descriptionController,
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        if (widget.contactGroup == null) {
                          nameController.clear();
                          descriptionController.clear();
                          setState(() {
                            for_ = null;
                            name = null;
                            color = null;
                            description = null;
                          });
                        } else {
                          final contactGroup = widget.contactGroup!;
                          nameController.text = contactGroup.name;
                          descriptionController.text = contactGroup.description ?? '';
                          for_ = contactGroup.for_;
                          setState(() {
                            for_ = contactGroup.for_;
                            name = contactGroup.name;
                            color = contactGroup.color?.value.toString();
                            description = contactGroup.description;
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
                        if (!addOrEditContactGroup.currentState!.validate()) {
                          return;
                        }

                        final controller = Get.find<BusinessManagerController>();

                        if (widget.contactGroup != null) {
                          controller.contactGroupController.updateContactGroup(
                            MockContactGroup(
                              id: widget.contactGroup!.id,
                              name: nameController.text,
                              for_: for_ ?? widget.contactGroup?.for_,
                              color: color != null ? Color(int.parse(color!)) : widget.contactGroup?.color,
                              description: descriptionController.text,
                            ),
                          );
                        } else {
                          controller.contactGroupController.addContactGroup(
                            MockContactGroup(
                              id: DateTime.now().millisecondsSinceEpoch.toString(),
                              name: nameController.text,
                              for_: for_,
                              color: color != null ? Color(int.parse(color!)) : AppColors.primaryBlue1,
                              description: descriptionController.text,
                            ),
                          );
                        }
                        Get.back<void>();
                      },
                      text: widget.contactGroup != null ? 'Update' : 'Submit',
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
