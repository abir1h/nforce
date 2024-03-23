import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class EmptyNoteView extends StatelessWidget {
  const EmptyNoteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          Text(
            'Add Note',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              '+ Add Note',
              style: TextStyle(
                color: AppColors.primaryBlue1,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          10.w.hSpace,
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic_none_outlined),
          ),
        ],
      ),
    );
  }
}
