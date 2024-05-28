import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nuforce/app/modules/business_manager/controllers/customer_contact_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_add_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/regional_setting/widget/custom_button.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/regional_setting/widget/custom_text_block.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

class CustomerContactDetailsView extends StatefulWidget {
  const CustomerContactDetailsView({
    super.key,
  });

  @override
  State<CustomerContactDetailsView> createState() => _CustomerContactDetailsViewState();
}

class _CustomerContactDetailsViewState extends State<CustomerContactDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: GetBuilder<CustomerContactController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final customer = controller.selectedContactDetails?.contact;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextBlock(
                  label: 'Name',
                  value: customer?.name ?? '-',
                ),
                const SizedBox(height: 16),
                CustomTextBlock(
                  label: 'Company',
                  value: customer?.company ?? '-',
                ),
                const SizedBox(height: 16),
                CustomTextBlock(
                  label: 'Email',
                  value: customer?.primaryEmail ?? '-',
                ),
                const SizedBox(height: 16),
                CustomTextBlock(
                  label: 'Mobile',
                  value: customer?.primaryMobile ?? '-',
                ),
                const SizedBox(height: 16),
                CustomTextBlock(
                  label: 'Group',
                  value: customer?.groupName ?? '-',
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Delete',
                        textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: 'Poppins', color: AppColors.red),
                        borderColor: AppColors.red,
                        primaryColored: false,
                        onPressed: () {
                          //controller.reset();
                        },
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomButton(
                        text: 'Edit',
                        onPressed: () {
                          Get.to<void>(() => const CustomerContactAddView());
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
