import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/contact_center_controller.dart';
import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/primary_button.dart';
import 'add_contact_center_view.dart';

class ContactCenterView extends StatefulWidget {
  const ContactCenterView({super.key});

  @override
  State<ContactCenterView> createState() => _ContactCenterViewState();
}

class _ContactCenterViewState extends State<ContactCenterView> {
  final controller = Get.put(ContactCenterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarMinimal(
        title: 'Contact Center',
        trailing: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () => Get.to<void>(() => const AddContactCenterView()),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 24.r,
                    color: AppColors.nutralBlack1,
                  ),
                  Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: controller.contactCenter != null
          ? SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.contactCenter?.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      fontFamily: "Poppins",
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    controller.contactCenter?.description ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      fontFamily: "Poppins",
                      color: AppColors.nutralBlack2,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColors.blueLight,
                        child: SvgPicture.asset(Assets.images.svg.officeLogo),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        controller.contactCenter?.officeName ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          color: AppColors.nutralBlack1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.images.svg.location),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        controller.contactCenter?.officeAdress ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          color: AppColors.nutralBlack2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.images.svg.phone),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        controller.contactCenter?.phoneNumber ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          color: AppColors.nutralBlack2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.images.svg.mail),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        controller.contactCenter?.email ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          color: AppColors.nutralBlack2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        Assets.images.svg.empty,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Empty Data',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.nutralBlack2,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h, left: 20.w, right: 20.w),
                  child: PrimaryButton(
                    onPressed: () {
                      Get.to<void>(const AddContactCenterView());
                    },
                    text: 'Add Contact Center Data',
                  ),
                ),
              ],
            ),
    );
  }
}
