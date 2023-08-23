import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../controllers/auth_controller.dart';

class AgentCustomerLoginView extends GetView<AuthController> {
  const AgentCustomerLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbar(
        title: '',
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.tabbarColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: SvgPicture.asset(Assets.images.svg.scan),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Scan QR',
                            style: CustomTextStyle.heading4.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.nutralBlack1,
                            ),
                          ),
                          Text(
                            'Click to scan your......',
                            style: CustomTextStyle.paragraphExtraSmall.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.nutralBlack2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.images.svg.nuforceLogo),
                    const SizedBox(height: 24),
                    Text(
                      'Welcome to NuForce',
                      style: CustomTextStyle.heading1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Get started on your journey to effortless service management.',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.subText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => CustomTabBar(
                          isSelected: controller.agentCustomerAuthController.tabIndex.value == 0,
                          onTap: () {
                            controller.agentCustomerAuthController.tabIndex.value = 0;
                          },
                          text: 'Recent Login',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => CustomTabBar(
                          isSelected: controller.agentCustomerAuthController.tabIndex.value == 1,
                          onTap: () {
                            controller.agentCustomerAuthController.tabIndex.value = 1;
                          },
                          text: 'New Login',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                  child: Obx(
                    () => controller.agentCustomerAuthController.tabIndex.value == 0
                        ? SizedBox(
                            height: height * 0.5,
                            child: Container(),
                          )
                        : SizedBox(
                            height: height * 0.6,
                            child: Text('New Login'),
                          ),
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
