import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/model/user_card_model.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/providers/work_order_provider.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/work_order_details_view.dart';
import 'package:nuforce/app/modules/customer/sub_modules/customer_aboutUs/views/customer_about_us_view.dart';
import 'package:nuforce/app/modules/customer/sub_modules/customer_language/views/customer_language_view.dart';
import 'package:nuforce/app/modules/customer/sub_modules/customer_paymentHistory/views/customer_payment_history_view.dart';
import 'package:nuforce/app/modules/customer/sub_modules/customer_profile/views/customer_profile_view.dart';
import 'package:nuforce/app/modules/customer/widgets/customer_work_order_tile.dart';
import 'package:nuforce/app/modules/service_items/widgets/search_widget.dart';
import 'package:nuforce/app/modules/settings/sub_modules/chat/view/chat_screen.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown_with_bg.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/global_states.dart';
import 'package:nuforce/main.dart';

import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/shared_preferences.dart';
import '../../settings/sub_modules/notification/view/notification_view.dart';
import '../../settings/widgets/setting_tile.dart';
import '../sub_modules/customer_faq/views/customer_faq_view.dart';
import '../sub_modules/customer_terms/views/customer_terms_view.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  @override
  void initState() {
    super.initState();
    Get.put(AppState()).setUser(
      UserCard(
        displayName: 'Abu Bokkor',
        businessName: '19 Dec, 2023',
        photoUrl: '',
      ),
    );
  }

  final List<String> items = <String>[
    'All',
    'Pending',
    'Completed',
    'Cancelled'
  ];
  String ddValue = 'All';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 80.w),
          child: Container(
            padding: EdgeInsets.all(16.h),
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerCard(
                    leading: Assets.images.svg.home0,
                    onTap: () {},
                    label: "Home",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
                  ),
                  DrawerCard(
                    leading: Assets.images.svg.stack,
                    onTap: () {},
                    label: "Wor Order",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
                  ),
                  DrawerCard(
                    leading: Assets.images.svg.myProfile,
                    onTap: () => Get.to<void>(() => const CustomerProfileView()),
                    label: "My profile",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
                  ),
                  DrawerCard(
                    leading: Assets.images.svg.notificationIcon,
                    onTap: () => Get.to<void>(() => const NotificationView()),
                    label: "Notifications",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
                  ),
                  DrawerCard(
                    leading: Assets.images.svg.constultation,
                    onTap: () {},
                    label: "Quick consultation",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
                  ), DrawerCard(
                    leading: Assets.images.svg.paymentOptions,
                    onTap: () => Get.to<void>(() => const CustomerPaymentHistoryView()),
                    label: "Payment History",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
                  ),DrawerCard(
                    leading: Assets.images.svg.paymentOptions,
                    onTap: () => Get.to<void>(() => const CustomerLanguageView()),
                    label: "Language",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
                  ),
                  DrawerCard(
                    leading: Assets.images.svg.faq,
                    onTap: () => Get.to<void>(() => const CustomerFaqView()),
                    label: "FAQs",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
                  ),
                  DrawerCard(
                    leading: Assets.images.svg.chat,
                    onTap: () => Get.to<void>(() => const ChatScreen()),
                    label: "Chat with us",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
                  ),
                  DrawerCard(
                    leading: Assets.images.svg.info,
                    onTap: () => Get.to<void>(() => const CustomerAboutUsView()),
                    label: "About Us",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
                  ),
                  DrawerCard(
                    leading: Assets.images.svg.terms,
                    onTap: () => Get.to<void>(() => const CustomerTermsView()),
                    label: "Terms & Conditions ",
                    action: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.nutralBlack2,
                    ),
                    hasDivider: true,
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
                          border: Border.all(color: AppColors.primaryBlue1)),
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
          ),
        ),
      ),
      appBar: CustomAppBar(
        leadingOnPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.horizontalPadding),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                const SearchWidget(showFilter: false),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    Text(
                      'Work Order List',
                      style: TextStyle(
                        color: AppColors.nutralBlack1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: CustomDropdownButtonWithBG(
                        bgColor: AppColors.textFieldBackground,
                        items: items.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                color: AppColors.nutralBlack1,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        }).toList(),
                        hint: '',
                        onChanged: (v) {
                          setState(() {
                            ddValue = v as String;
                          });
                        },
                        value: ddValue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: WorkOrderProvider.workOrderList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CustomerWorkOrderTile(
                          onTap: () {
                            Get.to<void>(
                              () => WorkOrderDetailsView(
                                order: WorkOrderProvider.workOrderList[index],
                              ),
                            );
                          },
                          order: WorkOrderProvider.workOrderList[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerCard extends StatelessWidget {
  final String leading;
  final String? label;
  final Widget? action;
  final bool? hasDivider;
  final VoidCallback? onTap;
  const DrawerCard({
    required this.leading,
    super.key,
    this.label,
    this.action,
    this.hasDivider,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        leading,
                        height: 24.r,
                        width: 24.r,color: AppColors.greyText,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        label ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 16.sp,
                            color: AppColors.nutralBlack1),
                      ),
                    ],
                  ),
                ),
                if (action != null)
                  action!
                else
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.nutralBlack2,
                  ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            if (hasDivider == true)
              const Divider(
                color: AppColors.white3,
                thickness: 1,
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
