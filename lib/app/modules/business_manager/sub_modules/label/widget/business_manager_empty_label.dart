import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_add_or_edit_label.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_label_controller.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class EmptyLabel extends StatelessWidget {
  const EmptyLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        Image.asset(Assets.images.png.emptyData.path),
        const SizedBox(height: 16),
        Text(
          'Empty Data, Please add new',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.subText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Expanded(child: SizedBox()),
        PrimaryButton(
          onPressed: () {
            final controller = Get.find<BusinessManagerLabelController>();
            controller.setLabelForm();
            Get.to<void>(() => const BusinessManagerAddOrEditLabel());
          },
          text: 'Add Labels',
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
