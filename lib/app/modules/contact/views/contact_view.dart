import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

import '../controllers/contact_controller.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  void initState() {
    super.initState();
    Get.put(ContactController());
  }

  @override
  void dispose() {
    Get.delete<ContactController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Add Contact',
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<ContactController>(
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
            GetBuilder<ContactController>(
              builder: (controller) {
                if (controller.isSaving) return const Center(child: CircularProgressIndicator());
                return PrimaryButton(
                  onPressed: () {
                    final controller = Get.find<ContactController>();

                    if (controller.formBuilder.textEditingControllers['name']?.text.isEmpty == true) {
                      Fluttertoast.showToast(msg: 'Name is required');
                      return;
                    }

                    controller.addContact().then((value) {
                      if (value == true) {
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
