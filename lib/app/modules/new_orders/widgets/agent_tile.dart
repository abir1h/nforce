import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/model/agents_model.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class AgentTile extends StatelessWidget {
  const AgentTile({
    required this.agent,
    required this.isSelected,
    required this.onChanged,
    required this.bgColor,
    this.selectedAgent,
    super.key,
  });
  final Agent agent;
  final Agent? selectedAgent;
  final bool isSelected;
  final Color bgColor;
  final void Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 40.w,
                width: 40.w,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white1, width: 2),
                  color: AppColors.primaryBlue1,
                  image: DecorationImage(
                    image: AssetImage(agent.image),
                    onError: (exception, stackTrace) {},
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 12.w,
                  width: 12.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.white1,
                      width: 2,
                    ),
                    color: agent.status == 'Active' ? AppColors.green : AppColors.greyText,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          12.w.hSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                agent.name,
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                agent.status,
                style: TextStyle(
                  color: AppColors.subText,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          Transform.scale(
            scale: 1.5,
            child: Radio(
              groupValue: selectedAgent,
              value: agent,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
