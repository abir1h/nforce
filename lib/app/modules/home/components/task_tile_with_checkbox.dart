import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_checkbox.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class TaskTileWithCheckbox extends StatelessWidget {
  const TaskTileWithCheckbox({
    required this.mockTaskApi,
    required this.onChanged,
    super.key,
  });

  final MockTaskApi mockTaskApi;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: mockTaskApi.isDone ? mockTaskApi.color : AppColors.textFieldBackground,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mockTaskApi.time,
                style: TextStyle(
                  fontSize: isIpad ? 8.sp : 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.nutralBlack1,
                ),
              ),
              Text(
                mockTaskApi.title,
                style: TextStyle(
                  fontSize: isIpad ? 8.sp : 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subText,
                  decoration: mockTaskApi.isDone ? TextDecoration.lineThrough : null,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: isIpad ? 10 : 0),
            child: CustomCheckbox(
              value: mockTaskApi.isDone,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
