import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/subscriptions/controller/subscription_controller.dart';
import 'package:nuforce/app/modules/settings/sub_modules/subscriptions/view/payment_view.dart';
import 'package:nuforce/app/modules/settings/widgets/contactus_card.dart';
import 'package:nuforce/app/modules/settings/widgets/subscription_card.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({super.key});

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  final controller = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Subscription',
        centerTitle: true,
      ),
      body: GetBuilder<SubscriptionController>(
        builder: (_) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: Text(
                    'Choose a Plan',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp, fontFamily: 'Poppins', color: AppColors.nutralBlack1),
                  ),
                ),
                Center(
                  child: Text(
                    'Find the best plan of your  service',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, fontFamily: 'Poppins', color: AppColors.nutralBlack1),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: Text(
                    'Vew Features ',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, fontFamily: 'Poppins', color: AppColors.primaryBlue1),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Monthly',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: controller.triggerValue == false ? AppColors.primaryBlue1 : AppColors.nutralBlack2,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    CupertinoSwitch(
                      trackColor: AppColors.primaryBlue1,
                      value: controller.triggerValue!,
                      activeColor: AppColors.primaryBlue1,
                      onChanged: controller.trigger,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      'Yearly',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: controller.triggerValue == true ? AppColors.primaryBlue1 : AppColors.nutralBlack2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                SubscriptionCard(
                  title: 'Starter',
                  subtitle1: 'Upto 5 users',
                  subtitle2: 'Organize your service in one place',
                  items: controller.data,
                  bgImage: Assets.images.png.grad1.keyName,
                ),
                SubscriptionCard(
                  title: 'Growth',
                  subtitle1: 'Upto 5 users',
                  subtitle2: 'Organize your service in one place',
                  items: controller.data,
                  bgImage: Assets.images.png.grad2.keyName,
                ),
                SubscriptionCard(
                  title: 'Pro',
                  subtitle1: 'Upto 3 users',
                  subtitle2: 'Organize your service in one place',
                  items: controller.data,
                  bgImage: Assets.images.png.grad3.keyName,
                ),
                ContactUsCard(
                  title: 'Enterprise',
                  subtitle: "Can't choose your package? please contact us",
                  bgImage: Assets.images.png.grad4.keyName,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () {
                          print('tapped');
                          Get.to<void>(() => const PaymentView());
                        },
                        text: 'Upgrade',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
