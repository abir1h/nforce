import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/controllers/settings_controller.dart';
import 'package:nuforce/app/modules/settings/sub_modules/account_info/account_information_view.dart';
import 'package:nuforce/app/modules/settings/sub_modules/branding/branding_view.dart';
import 'package:nuforce/app/modules/settings/sub_modules/customField/customfield_view_settings.dart';
import 'package:nuforce/app/modules/settings/sub_modules/notification/notification_view.dart';
import 'package:nuforce/app/modules/settings/sub_modules/offline_payment/offine_payment_view.dart';
import 'package:nuforce/app/modules/settings/sub_modules/subscriptions/view/active_plan_view.dart';
import 'package:nuforce/app/modules/settings/widgets/setting_tile.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../sub_modules/addons/view/addons_view.dart';
import '../sub_modules/calendar_sync/views/calendar_sync.dart';
import '../sub_modules/chat/view/chat_screen.dart';
import '../sub_modules/contact_center/view/contact_center_view.dart';
import '../sub_modules/expense/view/expense_view_screen.dart';
import '../sub_modules/faq/view/faq_view.dart';
import '../sub_modules/privacy_terms/privacy_policy_screen.dart';
import '../sub_modules/privacy_terms/terms_contdition.dart';
import '../sub_modules/refer/refer_screen.dart';
import '../sub_modules/route_suggestions/view/route_suggestion_screen.dart';
import '../sub_modules/schedule_settings/views/schedule_settings.dart';
import '../sub_modules/terms_policy/view/terms_policy_screen.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white1,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            fontFamily: 'Poppins',
            color: AppColors.nutralBlack1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'General',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SettingTile(
                      leading: Assets.images.png.accountInfo.keyName,
                      onTap: () =>
                          Get.to<void>(() => const AccountInformationView()),
                      label: 'Account Information',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.subscription.keyName,
                      onTap: () => Get.to<void>(() => const ActivePlan()),
                      label: 'Subscriptions',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.branding.keyName,
                      onTap: () => Get.to<void>(() => const BrandingView()),
                      label: 'Branding',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.offlinePayments.keyName,
                      onTap: () => Get.to<void>(() => const OfflinePayment()),
                      label: 'Offline Payments',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.expenseTracking.keyName,
                      onTap: () => Get.to<void>(() => const ExpenseView()),
                      label: 'Expense Tracking',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.customFields.keyName,
                      onTap: () =>
                          Get.to<void>(() => const CustomFieldSettingsView()),
                      label: 'Custom Fields',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.invoices.keyName,
                      onTap: () {},
                      label: 'Invoices',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.subscription.keyName,
                      onTap: () => Get.to<void>(() => const AddonsView()),
                      label: 'Plugins',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.notification.keyName,
                      onTap: () => Get.to<void>(() => const NotificationView()),
                      label: 'Notifications',
                      hasDivider: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Team Management',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SettingTile(
                      leading: Assets.images.png.teamSettings.keyName,
                      onTap: () {},
                      label: 'Team Settings',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.schedules.keyName,
                      onTap: () {Get.to<void>(() =>  ScheduleSettingView());},
                      label: 'Schedules',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.calendarSync.keyName,
                      onTap: () => Get.to<void>(() => const CalendarSyncView()),
                      label: 'Calendar Sync',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.routeSuggestions.keyName,
                      onTap: () => Get.to<void>(() => const RouteSuggestionScreen()),
                      label: 'Route Suggestions',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.informationForms.keyName,
                      onTap: () {},
                      label: 'Information Forms',
                      hasDivider: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Integrations',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SettingTile(
                      leading: Assets.images.png.webhookIntegration.keyName,
                      onTap: () {},
                      label: 'Webhook Integration',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.quickBooks.keyName,
                      onTap: () {},
                      label: 'QuickBooks',
                      hasDivider: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Affiliation',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SettingTile(
                      leading: Assets.images.png.refer.keyName,
                      onTap: () => Get.to<void>(() => const ReferScreen()),
                      label: 'Refer a Friend',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.affliation.keyName,
                      onTap: () {},
                      label: 'Affiliation',
                      hasDivider: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Messaging',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SettingTile(
                      leading: Assets.images.png.contactCenter.keyName,
                      onTap: () => Get.to<void>(() => const ContactCenterView()),
                      label: 'Contact Center',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.requests.keyName,
                      onTap: () {},
                      label: 'Requests',
                      hasDivider: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Help & Support',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SettingTile(
                      leading: Assets.images.png.quickConsultation.keyName,
                      onTap: () {},
                      label: 'Quick consultation ',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.requests.keyName,
                      onTap: () => Get.to<void>(() => const FaqView()),
                      label: 'FAQs',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.chatWithUs.keyName,
                      onTap: () => Get.to<void>(() => const ChatScreen()),
                      label: 'Chat with us',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.privacy.keyName,
                      onTap: () => Get.to<void>(() => const PrivacyPolicyScreen()),
                      label: 'Privacy',
                      hasDivider: true,
                    ),
                    SettingTile(
                      leading: Assets.images.png.terms.keyName,
                      onTap: () => Get.to<void>(() => const TermsCondtionScreen()),
                      label: 'Terms & Conditions',
                      hasDivider: false,
                    ), SettingTile(
                      leading: Assets.images.png.terms.keyName,
                      onTap: () => Get.to<void>(() => const TermsPolicyScreen()),
                      label: 'Terms & policy',
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
                Get.offAllNamed<void>(Routes.AUTH);
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
                      'Logout',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.primaryBlue1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: Text(
                'Version : 1.0.0',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.greyText,
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}
