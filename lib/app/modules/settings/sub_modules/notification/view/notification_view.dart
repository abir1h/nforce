import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_with_switch.dart';
import 'package:nuforce/app/modules/settings/widgets/notication_checkbox.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../controller/notification_controller.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppbarMinimal(
        title: 'Notification',
        trailing: [],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Obx(()=>Column(
          children: [
            TitleWithSwitch(
              text: "Push Notifications",
              isSwitchSelected: controller.pushNotificationSwitch.value,
              onSwitchChanged: (v)=>controller.triggerSwitch(SwitchTypeNotifcation.pushNotification, v),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 38.w),
              child: NotificationCheckBox(
                title: "Sound",
                onChanged: (v)=>controller.triggerSwitch(SwitchTypeNotifcation.sound, v!),
                isSelected: controller.soundSwitch.value,
                color: AppColors.primaryBlue1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 38.w),
              child: NotificationCheckBox(
                title: "Vibrate",
                onChanged: (v)=>controller.triggerSwitch(SwitchTypeNotifcation.vibrate, v!),
                isSelected: controller.vibrateSwitch.value,
                color: AppColors.primaryBlue1,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "Email",
              isSwitchSelected: controller.emailSwitch.value,
              onSwitchChanged: (v)=>controller.triggerSwitch(SwitchTypeNotifcation.email, v),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: "SMS",
              isSwitchSelected: controller.smsSwitch.value,
              onSwitchChanged: (v)=>controller.triggerSwitch(SwitchTypeNotifcation.sms, v),
            ),
          ],
        ),)
      ),
    );
  }
}
