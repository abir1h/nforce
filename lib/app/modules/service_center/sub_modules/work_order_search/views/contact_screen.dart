import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../widgets/service_centre_search_contact_card.dart';
import 'add_contact.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Contact (20)",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, fontFamily: "Poppins", color: AppColors.nutralBlack1),
              ),
              GestureDetector(
                onTap: () => Get.to(() => const AddContact()),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueBg,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.add,
                        size: 24.r,
                        color: AppColors.primaryBlue1,
                      ),
                      Text(
                        "Add New",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, fontFamily: "Poppins", color: AppColors.primaryBlue1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          ServiceCentreSearchCardContact(),
          SizedBox(
            height: 16.h,
          ),
          ServiceCentreSearchCardContact(),
          SizedBox(
            height: 16.h,
          ),
          ServiceCentreSearchCardContact(),
          SizedBox(
            height: 16.h,
          ),
          ServiceCentreSearchCardContact(),
          SizedBox(
            height: 16.h,
          ),
          ServiceCentreSearchCardContact(),
        ],
      ),
    );
  }
}
