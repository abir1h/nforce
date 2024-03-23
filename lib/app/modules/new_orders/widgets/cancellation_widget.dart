import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/text_with_bottom_border.dart';
import 'package:nuforce/app/utils/colors.dart';

class CancellationWidget extends StatelessWidget {
  const CancellationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CANCELLATION',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextWithBottomBorder(
          hint: '\$5.00 cancellation fee might be applied if cancelled after activation.',
          type: CustomType.dateTime,
          onTap: () {},
        ),
      ],
    );
  }
}
