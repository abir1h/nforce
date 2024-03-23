import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_topic/business_manager_service_topic_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';

GlobalKey<FormState> addOrEditServiceTopic = GlobalKey<FormState>();

class BusinessManagerAddOrEditServiceTopic extends StatefulWidget {
  const BusinessManagerAddOrEditServiceTopic({
    super.key,
    this.serviceTopic,
  });
  final MockServiceTopic? serviceTopic;

  @override
  State<BusinessManagerAddOrEditServiceTopic> createState() => _BusinessManagerAddOrEditCalendarViewState();
}

class _BusinessManagerAddOrEditCalendarViewState extends State<BusinessManagerAddOrEditServiceTopic> {
  String? name;
  String? topicNo;
  String? description;

  TextEditingController nameController = TextEditingController();
  TextEditingController topicNoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.serviceTopic != null) {
      final serviceTopic = widget.serviceTopic!;
      nameController.text = serviceTopic.name;
      descriptionController.text = serviceTopic.description ?? '';
      topicNoController.text = serviceTopic.topicNo ?? '';
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
        title: widget.serviceTopic != null ? 'Edit Service Topic' : 'Add Service Topic',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: Form(
          key: addOrEditServiceTopic,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              CustomTextField(
                label: 'Topic*',
                hint: 'Enter Topic name',
                controller: nameController,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter service topic name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Topic No',
                hint: 'Enter Topic No',
                controller: topicNoController,
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
                        if (widget.serviceTopic == null) {
                          nameController.clear();
                          descriptionController.clear();
                          setState(() {
                            name = null;
                            topicNo = null;
                            description = null;
                          });
                        } else {
                          final serviceTopic = widget.serviceTopic!;
                          nameController.text = serviceTopic.name;
                          descriptionController.text = serviceTopic.description ?? '';
                          topicNoController.text = serviceTopic.topicNo ?? '';
                          setState(() {
                            name = serviceTopic.name;
                            topicNo = serviceTopic.topicNo;
                            description = serviceTopic.description;
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
                        if (!addOrEditServiceTopic.currentState!.validate()) {
                          return;
                        }

                        final controller = Get.find<BusinessManagerController>();

                        if (widget.serviceTopic != null) {
                          controller.serviceTopicController.updateServiceTopic(
                            MockServiceTopic(
                              id: widget.serviceTopic!.id,
                              name: nameController.text,
                              topicNo: topicNoController.text,
                              description: descriptionController.text,
                            ),
                          );
                        } else {
                          controller.serviceTopicController.addServiceTopic(
                            MockServiceTopic(
                              id: DateTime.now().millisecondsSinceEpoch.toString(),
                              name: nameController.text,
                              topicNo: topicNoController.text,
                              description: descriptionController.text,
                            ),
                          );
                        }
                        Get.back<void>();
                      },
                      text: widget.serviceTopic != null ? 'Update' : 'Submit',
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
