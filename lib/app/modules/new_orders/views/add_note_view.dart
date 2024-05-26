import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/modules/new_orders/controllers/note_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({Key? key}) : super(key: key);

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  @override
  void initState() {
    super.initState();
    Get.put(NoteController());
  }

  @override
  void dispose() {
    Get.delete<NoteController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Add Note',
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<NoteController>(
                builder: (controller) {
                  return controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: controller.formBuilder.fieldNames.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final name = controller.formBuilder.fieldNames[index];
                            Widget? widget = controller.formBuilder.widgets[name];
                            if (widget != null && widget.runtimeType == CustomDropdownButton<Option?>) {
                              widget = (widget as CustomDropdownButton<Option?>).copyWith(
                                onChanged: (value) {
                                  controller.updateOnChanged(name, value);
                                },
                                value: controller.formBuilder.dropdownValue[name],
                              );

                              return Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: widget,
                              );
                            }

                            return Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: widget ?? const SizedBox.shrink(),
                            );
                          },
                        );
                },
              ),
            ),
            GetBuilder<NoteController>(
              builder: (controller) {
                if (controller.isSaving) return const Center(child: CircularProgressIndicator());
                return PrimaryButton(
                  onPressed: () {
                    final controller = Get.find<NoteController>();

                    if (controller.formBuilder.textEditingControllers['detailValue']?.text.isEmpty == true) {
                      Fluttertoast.showToast(msg: 'Note is required');
                      return;
                    }

                    controller.addNote(detailValue: controller.formBuilder.textEditingControllers['detailValue']!.text).then((value) {
                      if (value == true) {
                        final invoiceController = Get.find<InvoiceController>();
                        invoiceController.getNotes();
                        Get.back();
                      }
                    });
                  },
                  text: 'Save',
                );
              },
            ),
            30.h.vSpace,
          ],
        ),
      ),
    );
  }
}
