import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../service_items/widgets/plugin_item_card.dart';
import '../../../widgets/usage_tile.dart';

class Usage extends StatefulWidget {
  const Usage({super.key});

  @override
  State<Usage> createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
      child: Column(
        children: [
          UsageTile(
            label: "Users",
            trailing: Text(
              "3/10",
              style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins"),
            ),
          ),
          UsageTile(
            label: "Contacts",
            trailing: Text(
              "500/3000",
              style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins"),
            ),
          ),
          UsageTile(
            label: "Service Manger",
            trailing: Text(
              "5",
              style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins"),
            ),
          ),  UsageTile(
            label: "Human Resources",
            trailing: Text(
              "10",
              style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins"),
            ),
          ), UsageTile(
            label: "Accounting",
            trailing: Text(
              "10",
              style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins"),
            ),
          ),
        ],
      ),
    );
  }
}
