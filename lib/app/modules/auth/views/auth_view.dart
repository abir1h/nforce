import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/social_login_buttons.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                SvgPicture.asset(Assets.images.svg.nuforceLogo),
                const SizedBox(height: 30),
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
                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'Try NuForce For Free',
                  onPressed: () {},
                ),
                const SizedBox(height: 15),
                PrimaryButton(
                  text: 'Log in to your Business',
                  onPressed: () {},
                  primaryColored: false,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppColors.inactiveColor,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or log in with'),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppColors.inactiveColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const SocialLoginButtons(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login as an ',
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText,
                      ),
                    ),
                    Text(
                      'Agent ',
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryBlue1,
                      ),
                    ),
                    Text(
                      'or ',
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText,
                      ),
                    ),
                    Text(
                      'Customer',
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryBlue1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
