import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/customer_contact_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/contact/controllers/contact_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class CustomerContactAddView extends StatefulWidget {
  const CustomerContactAddView({super.key});

  @override
  State<CustomerContactAddView> createState() => _CustomerContactAddViewState();
}

class _CustomerContactAddViewState extends State<CustomerContactAddView> {
  final controller = Get.find<CustomerContactController>();

  late final ContactController contactFormController;

  @override
  void initState() {
    dependencies();
    super.initState();
  }

  Future<void> dependencies() async {
    if (Get.isRegistered<ContactController>()) {
      contactFormController = Get.find<ContactController>();
    } else {
      contactFormController = Get.put(ContactController());
    }
    log('Selected Contact: ${controller.selectedContactDetails?.contact?.id}', name: 'CustomerContactAddView');
    await contactFormController.setContactForm(controller.selectedContactDetails?.contact?.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Add Customer Contacts',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<CustomerContactController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return GetBuilder<ContactController>(
                    builder: (formController) {
                      return formController.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: formController.formBuilder.fieldNames.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final name = formController.formBuilder.fieldNames[index];
                                Widget? widget = formController.formBuilder.widgets[name];
                                if (widget != null && widget.runtimeType == CustomDropdownButton<Option?>) {
                                  widget = (widget as CustomDropdownButton<Option?>).copyWith(
                                    onChanged: (value) {
                                      formController.updateOnChanged(name, value);
                                    },
                                    value: formController.formBuilder.dropdownValue[name],
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
                  );
                },
              ),
            ),
            GetBuilder<ContactController>(
              builder: (contactController) {
                if (contactController.isSaving) return const Center(child: CircularProgressIndicator());
                return PrimaryButton(
                  onPressed: () async {
                    if (contactController.formBuilder.textEditingControllers['name']?.text.isEmpty == true) {
                      Fluttertoast.showToast(msg: 'Name is required');
                      return;
                    }

                    contactController.addContact(controller.selectedContactDetails?.contact?.id).then((value) async {
                      if (value == true) {
                        if (controller.selectedContactDetails != null) {
                          Get.back();
                          await controller.getContactDetails('${controller.selectedContactDetails?.contact?.id}');
                        }
                        await controller.getCustomers(showLoading: false);
                        if (controller.selectedContactDetails == null) {
                          Get.back();
                        }
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
