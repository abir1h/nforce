import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_label_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_color_picker.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

GlobalKey<FormState> addOrEditLabel = GlobalKey<FormState>();

class BusinessManagerAddOrEditLabel extends StatefulWidget {
  const BusinessManagerAddOrEditLabel({
    super.key,
    this.label,
  });
  final MockLabel? label;

  @override
  State<BusinessManagerAddOrEditLabel> createState() => _BusinessManagerAddOrEditCalendarViewState();
}

class _BusinessManagerAddOrEditCalendarViewState extends State<BusinessManagerAddOrEditLabel> {
  String? name;
  String? type;
  String? color;
  String? description;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.label != null) {
      final label = widget.label!;
      nameController.text = label.name;
      descriptionController.text = label.description ?? '';
      type = label.type;
      color = label.color?.value.toString();
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
        title: widget.label != null ? 'Edit Label' : 'Add Label',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: Form(
          key: addOrEditLabel,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              CustomTextField(
                label: 'Name*',
                hint: 'Enter name',
                controller: nameController,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomDropdownButton(
                label: 'Label',
                items: ['Service', 'Task', 'Invoice']
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
                    type = v as String?;
                  });
                },
                value: type,
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
                        if (widget.label == null) {
                          nameController.clear();
                          descriptionController.clear();
                          setState(() {
                            type = null;
                            name = null;
                            color = null;
                            description = null;
                          });
                        } else {
                          final label = widget.label!;
                          nameController.text = label.name;
                          descriptionController.text = label.description ?? '';
                          type = label.type;
                          setState(() {
                            type = label.type;
                            name = label.name;
                            color = label.color?.value.toString();
                            description = label.description;
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
                        if (!addOrEditLabel.currentState!.validate()) {
                          return;
                        }

                        final controller = Get.find<BusinessManagerController>();

                        if (widget.label != null) {
                          controller.labelController.updateLabel(
                            MockLabel(
                              id: widget.label!.id,
                              name: nameController.text,
                              type: type ?? widget.label?.type,
                              color: color != null ? Color(int.parse(color!)) : widget.label?.color,
                              description: descriptionController.text,
                            ),
                          );
                        } else {
                          controller.labelController.addLabel(
                            MockLabel(
                              id: DateTime.now().millisecondsSinceEpoch.toString(),
                              name: nameController.text,
                              type: type,
                              color: color != null ? Color(int.parse(color!)) : AppColors.primaryBlue1,
                              description: descriptionController.text,
                            ),
                          );
                        }
                        Get.back();
                      },
                      text: widget.label != null ? 'Update' : 'Submit',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
