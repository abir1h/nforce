import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_with_switch.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../controller/custom_field_controller.dart';

class CustomFieldSettingsView extends StatefulWidget {
  const CustomFieldSettingsView({super.key});

  @override
  State<CustomFieldSettingsView> createState() => _CustomFieldSettingsViewState();
}

class _CustomFieldSettingsViewState extends State<CustomFieldSettingsView> {
  final CustomFieldControllerSettings controller = Get.put(CustomFieldControllerSettings());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppbarMinimal(
        title: 'Notification',

      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Obx(()=>Column(
          children: [
            TitleWithSwitch(
              text: "Custom Field",
              isSwitchSelected: controller.customFieldSwitch.value,
              onSwitchChanged: (v) =>controller.triggerSwitch(SwitchTypeCustomField.customField, v),
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Customer",
              isSwitchSelected: controller.customerSwitch.value,
              onSwitchChanged: (v) =>controller.triggerSwitch(SwitchTypeCustomField.Customer, v),
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Agent",
              isSwitchSelected: controller.agentSwitch.value,
              onSwitchChanged: (v) =>controller.triggerSwitch(SwitchTypeCustomField.agent, v),
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Service",
              isSwitchSelected: controller.serviceSwitch.value,
              onSwitchChanged: (v) =>controller.triggerSwitch(SwitchTypeCustomField.service, v),
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Project",
              isSwitchSelected: controller.projectSwitch.value,
              onSwitchChanged: (v) =>controller.triggerSwitch(SwitchTypeCustomField.project, v),
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Pre-Order Fields",
              isSwitchSelected: controller.preorderFieldsSwitch.value,
              onSwitchChanged: (v) =>controller.triggerSwitch(SwitchTypeCustomField.preorderFields, v),
            ),
          ],
        ),)
      ),
    );
  }
}
