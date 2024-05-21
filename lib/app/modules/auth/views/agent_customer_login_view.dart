import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/new_login_form_widget.dart';
import 'package:nuforce/app/modules/auth/components/recent_login_tile.dart';
import 'package:nuforce/app/modules/auth/controllers/agent_customer_auth_controller.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class AgentCustomerLoginView extends StatelessWidget {
  const AgentCustomerLoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
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
                  children: [
                    Image.asset(
                      Assets.images.png.nuforceLogo.path,
                      width: width * 0.5,
                    ),
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
                ).ifIpad,
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: GetBuilder<AgentCustomerAuthController>(
                        builder: (controller) {
                          return CustomTabBar(
                            isSelected: controller.tabIndex == 0,
                            onTap: () {
                              controller.changeTabIndex(0);
                            },
                            text: 'Recent Login',
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: GetBuilder<AgentCustomerAuthController>(
                        builder: (controller) {
                          return CustomTabBar(
                            isSelected: controller.tabIndex == 1,
                            onTap: () {
                              controller.changeTabIndex(1);
                            },
                            text: 'New Login',
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                  child: GetBuilder<AgentCustomerAuthController>(
                    builder: (controller) {
                      return controller.tabIndex == 0
                          ? SizedBox(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: RecentLoginTile(
                                      onTap: () {
                                        Get.offAllNamed<void>(Routes.CUSTOMER);
                                      },
                                    ),
                                  );
                                },
                              ),
                            )
                          : const NewLoginFormWidget();
                    },
                  ),
                ).ifIpad,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
