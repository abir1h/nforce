import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_sizes.dart';
import '../../../../utils/colors.dart';

class PolicySscreen extends StatefulWidget {
  const PolicySscreen({
    super.key,
  });
  @override
  State<PolicySscreen> createState() => _PolicySscreenState();
}

class _PolicySscreenState extends State<PolicySscreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [PolicyCard()],
      ),
    );
  }
}

class PolicyCard extends StatelessWidget {
  const PolicyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), border: Border.all(color: AppColors.greyStrokColor, width: 1.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Agreement of Service',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: "Poppins", color: AppColors.nutralBlack1),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            'Another service policy',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, fontFamily: "Poppins", color: AppColors.nutralBlack2),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: ShapeDecoration(
              color: AppColors.deepYellow,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: Text(
              'Pending',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
