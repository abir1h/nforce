import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_calendar_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_color_picker.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

GlobalKey<FormState> addOrEditBMC = GlobalKey<FormState>();

class BusinessManagerAddOrEditCalendar extends StatefulWidget {
  const BusinessManagerAddOrEditCalendar({
    super.key,
    this.calendar,
  });
  final MockCalendar? calendar;

  @override
  State<BusinessManagerAddOrEditCalendar> createState() => _BusinessManagerAddOrEditCalendarViewState();
}

class _BusinessManagerAddOrEditCalendarViewState extends State<BusinessManagerAddOrEditCalendar> {
  String? name;
  String? timeZone;
  String? color;
  String? description;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.calendar != null) {
      final calendar = widget.calendar!;
      nameController.text = calendar.name;
      descriptionController.text = calendar.description ?? '';
      timeZone = calendar.timeZone;
      color = calendar.color?.value.toString();
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
        title: widget.calendar != null ? 'Edit Calendar' : 'Add New Calendar',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: Form(
          key: addOrEditBMC,
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
                label: 'Timezone',
                items: ['Timezone 1', 'Timezone 2', 'Timezone 3', 'Timezone 4']
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
                    timeZone = v as String?;
                  });
                },
                value: timeZone,
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
                        if (widget.calendar == null) {
                          nameController.clear();
                          descriptionController.clear();
                          setState(() {
                            timeZone = null;
                            name = null;
                            color = null;
                            description = null;
                          });
                        } else {
                          final calendar = widget.calendar!;
                          nameController.text = calendar.name;
                          descriptionController.text = calendar.description ?? '';
                          timeZone = calendar.timeZone;
                          setState(() {
                            timeZone = calendar.timeZone;
                            name = calendar.name;
                            color = calendar.color?.value.toString();
                            description = calendar.description;
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
                        if (!addOrEditBMC.currentState!.validate()) {
                          return;
                        }

                        final controller = Get.find<BusinessManagerController>();

                        if (widget.calendar != null) {
                          controller.businessManagerCalendarController.updateCalendar(
                            MockCalendar(
                              id: widget.calendar!.id,
                              name: nameController.text,
                              timeZone: timeZone ?? widget.calendar?.timeZone,
                              color: color != null ? Color(int.parse(color!)) : widget.calendar?.color,
                              description: descriptionController.text,
                            ),
                          );
                        } else {
                          controller.businessManagerCalendarController.addCalendar(
                            MockCalendar(
                              id: DateTime.now().millisecondsSinceEpoch.toString(),
                              name: nameController.text,
                              timeZone: timeZone,
                              color: color != null ? Color(int.parse(color!)) : AppColors.primaryBlue1,
                              description: descriptionController.text,
                            ),
                          );
                        }
                        Get.back<void>();
                      },
                      text: widget.calendar != null ? 'Update' : 'Submit',
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
