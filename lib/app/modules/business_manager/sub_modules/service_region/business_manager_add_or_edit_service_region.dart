import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_service_region_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_region_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/service_region_model.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

import '../../models/form_model.dart';

GlobalKey<FormState> addOrEditServiceRegion = GlobalKey<FormState>();

class BusinessManagerAddOrEditServiceRegion extends StatefulWidget {
  const BusinessManagerAddOrEditServiceRegion({
    super.key,
    this.serviceRegion,
  });
  final ServiceRegionModel? serviceRegion;

  @override
  State<BusinessManagerAddOrEditServiceRegion> createState() => _BusinessManagerAddOrEditServiceTopicViewState();
}

class _BusinessManagerAddOrEditServiceTopicViewState extends State<BusinessManagerAddOrEditServiceRegion> {
  final controller = Get.put(ServiceRegionEditController());

  @override
  void initState() {
    super.initState();
    if (widget.serviceRegion != null) {
      controller.setRegionForm(widget.serviceRegion!.id);
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
        title: widget.serviceRegion != null ? 'Edit Service Region' : 'Add Service Region',
      ),
      body: GetBuilder<ServiceRegionEditController>(builder: (controller) {
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
                  print(controller.formBuilder.textEditingControllers['name']!.text);
                  print(controller.formBuilder.textEditingControllers['groupCode']!.text);
                  print(controller.formBuilder.textEditingControllers['detailsPrefixCode']!.text);
                  print('${controller.formBuilder.dropdownValue['subType']?.value ?? ''}');
                /*  name: formBuilder.textEditingControllers['name']!.text,
                  groupCode: formBuilder.textEditingControllers['groupCode']!.text,
                  detailsPrefixCode: formBuilder.textEditingControllers['detailsPrefixCode']!.text,
                  subType: '${formBuilder.dropdownValue['detailsPrefixCode']?.value ?? ''}'*/

                  if (controller.formBuilder.textEditingControllers['name']?.text.isEmpty == true) {
                    Fluttertoast.showToast(msg: 'Name is required');
                    return;
                  } if (controller.formBuilder.textEditingControllers['subType']?.text.isEmpty == true) {
                    Fluttertoast.showToast(msg: 'Type is required');
                    return;
                  }
                  controller.addRegion(widget.serviceRegion!.id).then((value) {
                    if (value == true) {
                      final data = Get.find<BusinessManagerServiceRegionController>();
                      data.getRegions();
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
