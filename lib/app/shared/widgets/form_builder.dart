import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';

class CustomFormBuilder {
  List<String> fieldNames = [];
  Map<String, TextEditingController> controllers = {};
  Map<String, String? Function(String?)?> validator = {};
  Map<String, VoidCallback> onTap = {};
  Map<String, Widget> widgets = {};
}

CustomFormBuilder getForm(List<Control>? controls) {
  final formBuilder = CustomFormBuilder();
  if (controls == null) {
    return formBuilder;
  }
  for (final control in controls) {
    if (control.name != null && control.params?.type != 'hidden') {
      switch (control.editor) {
        case 'text':
          formBuilder.fieldNames.add(control.name!);
          formBuilder.controllers[control.name!] = TextEditingController();
          formBuilder.validator[control.name!] = (v) {
            if (v!.isEmpty) {
              return 'Please enter ${control.label}';
            }
            return null;
          };
          formBuilder.widgets[control.name!] = CustomTextField(
            label: control.label ?? '',
            hint: control.label ?? '',
            controller: formBuilder.controllers[control.name!],
            validator: formBuilder.validator[control.name!],
          );
          break;
        default:
          break;
      }
    }
  }
  return formBuilder;
}

/** 
if (controls.isEmpty) {
      return const SizedBox.shrink();
    } else {
      if (controls.first.params?.type != 'hidden') {
        switch (controls.first.editor) {
          case 'text':
            return CustomTextField(
              label: controls.first.label ?? '',
              hint: controls.first.label ?? '',
              controller: nameController,
              validator: (v) {
                if (v!.isEmpty) {
                  return 'Please enter item name';
                }
                return null;
              },
            );
          default:
            return const SizedBox.shrink();
        }
      } else {
        return const SizedBox.shrink();
      }
    }

**/