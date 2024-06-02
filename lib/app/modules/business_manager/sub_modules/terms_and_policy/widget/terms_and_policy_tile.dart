import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_terms_and_policy_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/service_terms_model.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class TermsAndPolicyTile extends StatelessWidget {
  const TermsAndPolicyTile({
    required this.termsAndPolicy,
    super.key,
    this.onTap,
  });

  final ServiceTermsModel termsAndPolicy;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.textFieldBackground,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.white3),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    termsAndPolicy.name,
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    termsAndPolicy.policyType,
                    style: TextStyle(
                      color: AppColors.subText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                Assets.images.svg.arrowRight,
                height: 16.sp,
                width: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
