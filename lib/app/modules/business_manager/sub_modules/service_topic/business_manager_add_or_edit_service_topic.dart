import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_service_topic_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_topic_edit_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

import '../../../../shared/widgets/custom_dropdown.dart';
import '../../controllers/service_category_edit_controller.dart';
import '../../models/form_model.dart';
import '../../models/service_topic_model.dart';

GlobalKey<FormState> addOrEditServiceTopic = GlobalKey<FormState>();

class BusinessManagerAddOrEditServiceTopic extends StatefulWidget {
  const BusinessManagerAddOrEditServiceTopic({
    super.key,
    this.serviceTopic,
  });
  final ServiceTopicModel? serviceTopic;

  @override
  State<BusinessManagerAddOrEditServiceTopic> createState() =>
      _BusinessManagerAddOrEditCalendarViewState();
}

class _BusinessManagerAddOrEditCalendarViewState
    extends State<BusinessManagerAddOrEditServiceTopic> {
  final controller = Get.put(ServiceTopicEditController());

  @override
  void initState() {
    super.initState();
    if (widget.serviceTopic != null) {
      controller.setTopicForm(widget.serviceTopic!.id);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbarMinimal(
          title: widget.serviceTopic != null
              ? 'Edit Service Topic'
              : 'Add Service Topic',
        ),
        body: GetBuilder<ServiceTopicEditController>(builder: (controller) {
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalPadding),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                        itemCount: controller.formBuilder.fieldNames.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final name = controller.formBuilder.fieldNames[index];
                          Widget? widget = controller.formBuilder.widgets[name];
                          if (widget != null &&
                              widget.runtimeType ==
                                  CustomDropdownButton<Option?>) {
                            widget = (widget as CustomDropdownButton<Option?>)
                                .copyWith(
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
                      )),
                      controller.isSaving
                          ? const Center(child: CircularProgressIndicator())
                          : PrimaryButton(
                              onPressed: () {
                                // controller.addCategory();

                                if (controller
                                        .formBuilder
                                        .textEditingControllers['name']
                                        ?.text
                                        .isEmpty ==
                                    true) {
                                  Fluttertoast.showToast(
                                      msg: 'Name is required');
                                  return;
                                }
                                if (controller
                                        .formBuilder
                                        .textEditingControllers[
                                            'detailsDescription']
                                        ?.text
                                        .isEmpty ==
                                    true) {
                                  Fluttertoast.showToast(
                                      msg: 'details.description is required');
                                  return;
                                }
                                controller
                                    .addTopic(widget.serviceTopic!.id)
                                    .then((value) {
                                  if (value == true) {
                                    final data = Get.find<
                                        BusinessManagerServiceTopicController>();
                                    data.getServiceTopics();
                                    Get.back();
                                  }
                                });
                              },
                              text: 'Save',
                            ),
                      30.h.vSpace,
                    ],
                  ),
                );
        }));
  }
}
