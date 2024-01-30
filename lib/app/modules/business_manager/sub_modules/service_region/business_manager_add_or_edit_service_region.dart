import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_region/business_manager_service_region_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

GlobalKey<FormState> addOrEditServiceRegion = GlobalKey<FormState>();

class BusinessManagerAddOrEditServiceRegion extends StatefulWidget {
  const BusinessManagerAddOrEditServiceRegion({
    super.key,
    this.serviceRegion,
  });
  final MockServiceRegion? serviceRegion;

  @override
  State<BusinessManagerAddOrEditServiceRegion> createState() => _BusinessManagerAddOrEditServiceTopicViewState();
}

class _BusinessManagerAddOrEditServiceTopicViewState extends State<BusinessManagerAddOrEditServiceRegion> {
  String? type;
  String? status;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dialPrefixController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.serviceRegion != null) {
      final serviceRegion = widget.serviceRegion!;
      nameController.text = serviceRegion.name;
      addressController.text = serviceRegion.address ?? '';
      dialPrefixController.text = serviceRegion.dialPrefix ?? '';
      type = serviceRegion.type;
      status = serviceRegion.status;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    dialPrefixController.dispose();
    status = null;
    type = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.serviceRegion != null ? 'Edit Service Region' : 'Add Service Region',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: Form(
          key: addOrEditServiceRegion,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              CustomTextField(
                label: 'Name*',
                hint: 'Enter region name',
                controller: nameController,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Region name can not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 4),
              Text(
                'Please provide relevant information for Name',
                style: TextStyle(
                  color: AppColors.subText,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              CustomDropdownButton(
                label: 'Type',
                items: ['Country', 'State', 'City'].map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.nutralBlack1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }).toList(),
                hint: 'Select type',
                onChanged: (newV) {
                  setState(() {
                    type = newV as String?;
                  });
                },
                value: type,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Dial Prefix',
                hint: 'Enter dial prefix',
                controller: dialPrefixController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Addr.',
                hint: 'Enter address',
                controller: addressController,
              ),
              const SizedBox(height: 16),
              CustomDropdownButton(
                label: 'Status',
                items: ['Active', 'Inactive'].map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.nutralBlack1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }).toList(),
                hint: 'Select status',
                onChanged: (newV) {
                  setState(() {
                    status = newV as String?;
                  });
                },
                value: status,
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        if (widget.serviceRegion == null) {
                          nameController.clear();
                          addressController.clear();
                          dialPrefixController.clear();
                          setState(() {
                            type = null;
                            status = null;
                          });
                        } else {
                          final serviceTopic = widget.serviceRegion!;
                          nameController.text = serviceTopic.name;
                          addressController.text = serviceTopic.address ?? '';
                          dialPrefixController.text = serviceTopic.dialPrefix ?? '';
                          setState(() {
                            type = serviceTopic.type;
                            status = serviceTopic.status;
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
                        if (!addOrEditServiceRegion.currentState!.validate()) {
                          return;
                        }

                        final controller = Get.find<BusinessManagerController>();

                        if (widget.serviceRegion != null) {
                          controller.serviceRegionController.updateServiceRegion(
                            MockServiceRegion(
                              id: widget.serviceRegion!.id,
                              name: nameController.text,
                              address: addressController.text,
                              dialPrefix: dialPrefixController.text,
                              type: type,
                              status: status,
                            ),
                          );
                        } else {
                          controller.serviceRegionController.addServiceRegion(
                            MockServiceRegion(
                              id: DateTime.now().millisecondsSinceEpoch.toString(),
                              name: nameController.text,
                              address: addressController.text,
                              dialPrefix: dialPrefixController.text,
                              type: type,
                              status: status,
                            ),
                          );
                        }
                        Get.back<void>();
                      },
                      text: widget.serviceRegion != null ? 'Update' : 'Submit',
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
