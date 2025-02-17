import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/home/components/action_tile.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class RecommandedActionsWidget extends StatelessWidget {
  const RecommandedActionsWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isIpad ? (width * 0.6) : (width * 0.8),
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.inactiveColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.textFieldBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommanded Actions',
                style: TextStyle(
                  fontSize: isIpad ? 10.sp : 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.nutralBlack1,
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: controller.mockRecommandeActions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ActionsTile(
                text: controller.mockRecommandeActions[index].text,
                color: controller.mockRecommandeActions[index].color,
                onTap: () {},
                isLast: index == 4,
              );
            },
          ),
        ],
      ),
    );
  }
}
