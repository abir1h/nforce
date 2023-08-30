import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_checkbox.dart';
import 'package:nuforce/app/utils/colors.dart';

class TaskTileWithCheckbox extends StatelessWidget {
  const TaskTileWithCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.lightPink,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '4:30 AM',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.nutralBlack1,
                ),
              ),
              Text(
                'Service call',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subText,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          CustomCheckbox(
            value: true,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
