import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_checkbox.dart';
import 'package:nuforce/app/utils/colors.dart';

class TaskTileWithCheckbox extends StatelessWidget {
  const TaskTileWithCheckbox({
    super.key,
    required this.mockTaskApi,
    required this.onChanged,
  });

  final MockTaskApi mockTaskApi;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 15),
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
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.nutralBlack1,
                ),
              ),
              Text(
                mockTaskApi.title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subText,
                  decoration: mockTaskApi.isDone ? TextDecoration.lineThrough : null,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
          CustomCheckbox(
            value: mockTaskApi.isDone,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
