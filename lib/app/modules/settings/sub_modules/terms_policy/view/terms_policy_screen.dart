import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../business_manager/controllers/custom_field_controller.dart';
import '../../../../business_manager/sub_modules/custom_field/widgets/detail_card.dart';
import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import 'add_terms_policy.dart';

class TermsPolicyScreen extends StatefulWidget {
  const TermsPolicyScreen({super.key});

  @override
  State<TermsPolicyScreen> createState() => _TermsPolicyScreenState();
}

class _TermsPolicyScreenState extends State<TermsPolicyScreen> {
  final CustomFieldController controller = Get.put(CustomFieldController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarMinimal(
        title: 'Terms & Policy',
        trailing: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () => Get.to<void>(const AddTermsPolicyScreen()),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            const DetailCard(
              title: 'Terms of Service',
              subtitle: 'Terms of Service',
            ),
            SizedBox(
              height: 16.h,
            ),
            DetailCard(
              title: 'Another Service Policy',
              subtitle: 'Agreement of Service',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DetailCard(
              title: 'Estimation Quotation',
              subtitle: 'Quotation Terms',
            ),
            SizedBox(
              height: 16.h,
            ),
            DetailCard(
              title: 'Notice of Cancellation',
              subtitle: 'Notice of Cancellation',
            ),
            SizedBox(
              height: 16.h,
            ),
            DetailCard(
              title: 'Acknowledgement Agreement',
              subtitle: 'Agreemnet of Service ',
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
