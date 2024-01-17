import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_with_switch.dart';

import '../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../utils/colors.dart';
import '../../../home/components/colored_checkbox_with_title.dart';
import '../../views/settings_view.dart';
import '../../widgets/notication_checkbox.dart';

class CustomFieldSettingsView extends StatefulWidget {
  const CustomFieldSettingsView({super.key});

  @override
  State<CustomFieldSettingsView> createState() => _CustomFieldSettingsViewState();
}

class _CustomFieldSettingsViewState extends State<CustomFieldSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarMinimal(
        title: 'Notification',
        trailing: [],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            TitleWithSwitch(
              text: "Custom Field",
              isSwitchSelected: true,
              onSwitchChanged: (v) {},
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Customer",
              isSwitchSelected: true,
              onSwitchChanged: (v) {},
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Agent",
              isSwitchSelected: true,
              onSwitchChanged: (v) {},
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Service",
              isSwitchSelected: true,
              onSwitchChanged: (v) {},
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Project",
              isSwitchSelected: true,
              onSwitchChanged: (v) {},
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Pre-Order Fields",
              isSwitchSelected: true,
              onSwitchChanged: (v) {},
            ),
          ],
        ),
      ),
    );
  }
}
