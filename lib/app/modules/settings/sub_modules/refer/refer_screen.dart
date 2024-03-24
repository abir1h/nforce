import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class ReferScreen extends StatefulWidget {
  const ReferScreen({super.key});

  @override
  State<ReferScreen> createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppbarMinimal(
        title: 'Refer & Earn',
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Image.asset(Assets.images.png.referIm.keyName),
              ),
              SizedBox(
                height: 32.h,
              ),
              Center(
                child: Text(
                  'Refer a friend',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Share your code with 4 friends. When they use it for the first login, you and your friends earn \$05.00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.nutralBlack2,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r),
                        ),
                        border: Border.all(color: AppColors.primaryBlue3),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 16.h,
                      ),
                      child: Text(
                        "AHDJAEL2021RV1",
                        style: TextStyle(
                          color: AppColors.nutralBlack3,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                      ),
                      color: AppColors.primaryBlue1,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.h),
                    child: const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Or",
                style: TextStyle(
                  color: AppColors.nutralBlack3,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: Image.asset(Assets.images.png.facebook.keyName),),
                  Expanded(
                      child: Image.asset(Assets.images.png.google.keyName),),
                  Expanded(
                      child: Image.asset(Assets.images.png.twitter.keyName),),
                  Expanded(child: Image.asset(Assets.images.png.insta.keyName)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
