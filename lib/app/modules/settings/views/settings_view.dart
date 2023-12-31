import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../utils/colors.dart';
import '../controllers/settings_controller.dart';
import '../sub_modules/account_info/account_information_view.dart';
import '../sub_modules/subscriptions/view/active_plan_view.dart';
import '../widgets/setting_tile.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.textFieldBackground,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white1,
          title: Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp, fontFamily: "Poppins", color: AppColors.nutralBlack1),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2), spreadRadius: 0, offset: Offset(0, 0), blurRadius: 4)]),
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingTile(
                        leading: Assets.images.png.accountInfo.keyName.toString(),
                        onTap: () => Get.to(() => const AccountInformationView()),
                        label: "Account Information",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.subscription.keyName.toString(),
                        onTap: () => Get.to(() => const ActivePlan()),
                        label: "Subscriptions",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.branding.keyName.toString(),
                        onTap: () {},
                        label: "Branding",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.offlinePayments.keyName.toString(),
                        onTap: () {},
                        label: "Offline Payments",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.expenseTracking.keyName.toString(),
                        onTap: () {},
                        label: "Expense Tracking",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.offlinePayments.keyName.toString(),
                        onTap: () {},
                        label: "Expense Tracking",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.customFields.keyName.toString(),
                        onTap: () {},
                        label: "Custom Fields",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.invoices.keyName.toString(),
                        onTap: () {},
                        label: "Invoices",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.subscription.keyName.toString(),
                        onTap: () {},
                        label: "Plugins",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.notification.keyName.toString(),
                        onTap: () {},
                        label: "Notifications",
                        hasDivider: false,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Team Management',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2), spreadRadius: 0, offset: Offset(0, 0), blurRadius: 4)]),
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingTile(
                        leading: Assets.images.png.teamSettings.keyName.toString(),
                        onTap: () {},
                        label: "Team Settings",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.schedules.keyName.toString(),
                        onTap: () {},
                        label: "Schedules",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.calendarSync.keyName.toString(),
                        onTap: () {},
                        label: "Calendar Sync",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.routeSuggestions.keyName.toString(),
                        onTap: () {},
                        label: "Route Suggestions",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.informationForms.keyName.toString(),
                        onTap: () {},
                        label: "Information Forms",
                        hasDivider: false,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Integrations',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2), spreadRadius: 0, offset: Offset(0, 0), blurRadius: 4)]),
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingTile(
                        leading: Assets.images.png.webhookIntegration.keyName.toString(),
                        onTap: () {},
                        label: "Webhook Integration",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.quickBooks.keyName.toString(),
                        onTap: () {},
                        label: "QuickBooks",
                        hasDivider: false,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Affiliation',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2), spreadRadius: 0, offset: Offset(0, 0), blurRadius: 4)]),
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingTile(
                        leading: Assets.images.png.refer.keyName.toString(),
                        onTap: () {},
                        label: "Refer a Friend",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.affliation.keyName.toString(),
                        onTap: () {},
                        label: "Affiliation",
                        hasDivider: false,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Messaging',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2), spreadRadius: 0, offset: Offset(0, 0), blurRadius: 4)]),
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingTile(
                        leading: Assets.images.png.contactCenter.keyName.toString(),
                        onTap: () {},
                        label: "Contact Center",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.requests.keyName.toString(),
                        onTap: () {},
                        label: "Requests",
                        hasDivider: false,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Help & Support',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2), spreadRadius: 0, offset: Offset(0, 0), blurRadius: 4)]),
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingTile(
                        leading: Assets.images.png.quickConsultation.keyName.toString(),
                        onTap: () {},
                        label: "Quick consultation ",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.requests.keyName.toString(),
                        onTap: () {},
                        label: "FAQs",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.chatWithUs.keyName.toString(),
                        onTap: () {},
                        label: "Chat with us",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.privacy.keyName.toString(),
                        onTap: () {},
                        label: "Privacy",
                        hasDivider: true,
                      ),
                      SettingTile(
                        leading: Assets.images.png.terms.keyName.toString(),
                        onTap: () {},
                        label: "Terms & Conditions",
                        hasDivider: false,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () {
                  SharedPreferenceService.clear();
                  Get.offAllNamed(Routes.AUTH);
                  Fluttertoast.showToast(msg: 'Logged out');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.images.png.logout.keyName,
                        height: 24.r,
                        width: 24.r,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w600, fontSize: 16.sp, color: AppColors.primaryBlue1),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Center(
                  child: Text(
                "Version : 1.0.0",
                style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 14.sp, color: AppColors.greyText),
              ))
            ],
          ),
        ));
  }
}
