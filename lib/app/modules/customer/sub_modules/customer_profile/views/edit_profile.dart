import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../../utils/colors.dart';
import '../controllers/customer_profile_controller.dart';

class EditProfile extends GetView<CustomerProfileController> {
  const EditProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerProfileController());

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Get.back(),
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
                Text(
                  "Update",
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
        title: "Edit Profile",
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 36.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      controller.openImagePicker(context);
                    },
                    child: Stack(
                      children: [
                        controller.images.isNotEmpty
                            ? CircleAvatar(radius: 80, backgroundImage: FileImage(File(controller.images.first.path)))
                            : CircleAvatar(radius: 80, backgroundImage: AssetImage(Assets.images.png.profileAvatar.keyName)),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                controller.openImagePicker(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextField(label: 'Full Name', hint: "Enter your full name", controller: TextEditingController()),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(label: 'Email', hint: "Enter your email", controller: TextEditingController()),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(label: 'Phone Number', hint: "Enter your phone", controller: TextEditingController()),
              ],
            ),
          )),
    );
  }
}

class ProfileLabelSection extends StatelessWidget {
  final String label;
  final String data;
  const ProfileLabelSection({super.key, required this.label, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
