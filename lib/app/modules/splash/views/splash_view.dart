import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/splash/controllers/splash_controller.dart';
import 'package:nuforce/app/utils/app_constants.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    controller.onInit();
    return Scaffold(
      backgroundColor: AppColors.primaryBlue1,
      body: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(Assets.images.png.nuforceSplash.path),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Positioned(
                bottom: 70,
                left: 0,
                right: 0,
                child: Text(
                  AppConstants.splashBottom,
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.paragraphMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
