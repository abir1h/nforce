import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../../utils/colors.dart';
import '../controllers/customer_profile_controller.dart';
import 'edit_profile.dart';

class CustomerProfileView extends GetView<CustomerProfileController> {
  const CustomerProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Get.to<void>(() => const EditProfile()),
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue1,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.images.svg.editIc,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "Edit",
                  style: CustomTextStyle.commonBold.copyWith(
                    color: AppColors.white1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: const CustomAppbarMinimal(
        title: "My Profile",
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 36.h,
            ),
            Center(
              child: CircleAvatar(
                radius: 40.r,
                backgroundImage: AssetImage(Assets.images.png.profileAvatar.keyName),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const ProfileLabelSection(
              label: "Full Name",
              data: "Ibne Riead",
            ),
            SizedBox(
              height: 16.h,
            ),
            const ProfileLabelSection(
              label: "Email",
              data: "shaidulislma@gmail.com",
            ),
            SizedBox(
              height: 16.h,
            ),
            const ProfileLabelSection(
              label: "Phone Number",
              data: "01856154125",
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileLabelSection extends StatelessWidget {
  final String label;
  final String data;
  const ProfileLabelSection({super.key, required this.label, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: CustomTextStyle.commonLabel,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            data,
            style: CustomTextStyle.commonTitle,
          ),
        ],
      ),
    );
  }
}
