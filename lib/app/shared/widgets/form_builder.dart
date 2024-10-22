import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_tags_input.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CustomFormBuilder {
  final List<String> fieldNames;
  final Map<String, TextEditingController> textEditingControllers;
  final Map<String, StringTagController> stringTagControllers;
  final Map<String, void Function(Option?)?> onChanged;
  final Map<String, Option?> dropdownValue;
  final Map<String, String? Function(String?)?> validator;
  final Map<String, VoidCallback> onTap;
  final Map<String, Widget> widgets;

  CustomFormBuilder({
    this.fieldNames = const [],
    this.textEditingControllers = const {},
    this.stringTagControllers = const {},
    this.onChanged = const {},
    this.dropdownValue = const {},
    this.validator = const {},
    this.onTap = const {},
    this.widgets = const {},
  });

  CustomFormBuilder copyWith({
    List<String>? fieldNames,
    Map<String, TextEditingController>? textEditingControllers,
    Map<String, StringTagController>? stringTagControllers,
    Map<String, void Function(Option?)?>? onChanged,
    Map<String, Option?>? dropdownValue,
    Map<String, String? Function(String?)?>? validator,
    Map<String, VoidCallback>? onTap,
    Map<String, Widget>? widgets,
  }) {
    return CustomFormBuilder(
      fieldNames: fieldNames ?? this.fieldNames,
      textEditingControllers: textEditingControllers ?? this.textEditingControllers,
      stringTagControllers: stringTagControllers ?? this.stringTagControllers,
      onChanged: onChanged ?? this.onChanged,
      dropdownValue: dropdownValue ?? this.dropdownValue,
      validator: validator ?? this.validator,
      onTap: onTap ?? this.onTap,
      widgets: widgets ?? this.widgets,
    );
  }
}

CustomFormBuilder getForm({List<Control>? controls}) {
  CustomFormBuilder formBuilder = CustomFormBuilder();
  if (controls == null) {
    return formBuilder;
  }
  for (final control in controls) {
    if (control.name != null && control.params?.type != 'hidden') {
      switch (control.editor) {
        case 'text':
          // if (control.params?.paramsClass == 'color-picker') {
          //   formBuilder = formBuilder.copyWith(
          //     fieldNames: [...formBuilder.fieldNames, control.name!],
          //   );

          //   // add onchange function
          //   formBuilder = formBuilder.copyWith(
          //     onChanged: {
          //       ...formBuilder.onChanged,
          //       control.name!: (value) {
          //         formBuilder.dropdownValue[control.name!] = value;
          //       },
          //     },
          //   );

          //   String colorString = AppColors.primaryBlue1.toString();
          //   if (control.value != null && control.value is String) {
          //     if (control.value!.startsWith('#')) {
          //       colorString = control.value.toString().substring(1).toUpperCase();
          //       colorString = '0xFF$colorString';
          //     }
          //     while (colorString.length < 8) {
          //       colorString += '0';
          //     }
          //   }

          //   formBuilder = formBuilder.copyWith(
          //     widgets: {
          //       ...formBuilder.widgets,
          //       control.name!: FormBuilderColorPicker(
          //         label: control.label ?? 'Color',
          //         pickerColor: colorString,
          //         onColorChanged: (p0) {
          //           // formBuilder.dropdownValue[control.name!] = p0;
          //         },
          //       ),
          //     },
          //   );
          // } else {
          formBuilder = formBuilder.copyWith(
            fieldNames: [...formBuilder.fieldNames, control.name!],
          );
          formBuilder = formBuilder.copyWith(
            textEditingControllers: {
              ...formBuilder.textEditingControllers,
              control.name!: TextEditingController(),
            },
          );
          formBuilder = formBuilder.copyWith(
            validator: {
              ...formBuilder.validator,
              control.name!: (v) {
                if (v!.isEmpty) {
                  return 'Please enter ${control.label}';
                }
                return null;
              },
            },
          );
          formBuilder = formBuilder.copyWith(
            widgets: {
              ...formBuilder.widgets,
              control.name!: CustomTextField(
                label: control.label ?? '',
                hint: control.params?.help ?? control.label ?? '',
                controller: formBuilder.textEditingControllers[control.name!],
                validator: formBuilder.validator[control.name!],
                maxLines: control.params?.type == 'textarea' ? 3 : 1,
              ),
            },
          );

          if (control.value != null) {
            formBuilder.textEditingControllers[control.name!]!.text = control.value.toString();
          }

          break;
        // }
        case 'dropdown':
          // Just name
          formBuilder = formBuilder.copyWith(
            fieldNames: [...formBuilder.fieldNames, control.name!],
          );

          // Just onchanged method for one dropdown
          formBuilder = formBuilder.copyWith(
            onChanged: {
              ...formBuilder.onChanged,
              control.name!: (value) {
                formBuilder.dropdownValue[control.name!] = value;
              },
            },
          );

          if (control.value != null) {
            for (final option in control.options!) {
              // If there is nested options in dropdown
              if (option.option?.isNotEmpty ?? false) {
                for (final opt in option.option!) {
                  if (opt.value == control.value) {
                    formBuilder = formBuilder.copyWith(
                      dropdownValue: {
                        ...formBuilder.dropdownValue,
                        control.name!: opt,
                      },
                    );
                    break;
                  } else {
                    formBuilder = formBuilder.copyWith(
                      dropdownValue: {
                        ...formBuilder.dropdownValue,
                        control.name!: null,
                      },
                    );
                  }
                }
              } else if (option.value == control.value) {
                formBuilder = formBuilder.copyWith(
                  dropdownValue: {
                    ...formBuilder.dropdownValue,
                    control.name!: option,
                  },
                );
                break;
              } else {
                formBuilder = formBuilder.copyWith(
                  dropdownValue: {
                    ...formBuilder.dropdownValue,
                    control.name!: null,
                  },
                );
              }
            }
          } else {
            formBuilder = formBuilder.copyWith(
              dropdownValue: {
                ...formBuilder.dropdownValue,
                control.name!: control.value,
              },
            );
          }

          List<DropdownMenuItem<Option?>> items = [];
          if (control.options != null) {
            for (final option in control.options!) {
              if (option.option?.isNotEmpty ?? false) {
                for (final opt in option.option!) {
                  items.add(DropdownMenuItem(
                    value: opt,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          opt.label ?? '',
                          style: TextStyle(
                            color: AppColors.nutralBlack2,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          ' (${option.label ?? ''})',
                          style: TextStyle(
                            color: AppColors.nutralBlack3,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ));
                }
              } else {
                items.add(DropdownMenuItem(
                  value: option,
                  child: Text(
                    option.label ?? '',
                    style: TextStyle(
                      color: AppColors.nutralBlack2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ));
              }
            }

            // if(control.options[0].option){

            // } else {

            // control.options
            //     ?.map(
            //       (e) => DropdownMenuItem(
            //         value: e,
            //         child: Text(
            //           e.label ?? '',
            //           style: TextStyle(
            //             color: AppColors.nutralBlack2,
            //             fontSize: 16.sp,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //       ),
            //     )
            //     .toList();
            // }
          }

          formBuilder = formBuilder.copyWith(
            widgets: {
              ...formBuilder.widgets,
              control.name!: CustomDropdownButton<Option?>(
                label: control.label ?? '',
                hint: control.label ?? '',
                onChanged: formBuilder.onChanged[control.name!]!,
                value: formBuilder.dropdownValue[control.name!],
                items: items,
              ),
            },
          );
        case 'tagsinput':
          formBuilder = formBuilder.copyWith(
            fieldNames: [...formBuilder.fieldNames, control.name!],
          );
          formBuilder = formBuilder.copyWith(
            stringTagControllers: {
              ...formBuilder.stringTagControllers,
              control.name!: StringTagController(),
            },
          );
          formBuilder = formBuilder.copyWith(
            widgets: {
              ...formBuilder.widgets,
              control.name!: CustomTagsInput(
                label: control.label ?? '',
                hint: control.params?.help ?? control.label ?? '',
                stringTagController: formBuilder.stringTagControllers[control.name!]!,
              ),
            },
          );
          break;

        default:
          break;
      }
    }
  }
  return formBuilder;
}
