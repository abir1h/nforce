import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/modules/today/controllers/today_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class ScheduleTileForTodayView extends StatelessWidget {
  const ScheduleTileForTodayView({
    super.key,
    required this.eventChild,
  });
  final EventChild eventChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      decoration: BoxDecoration(
        color: eventChild.color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventChild.title,
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                eventChild.status,
                style: TextStyle(
                  color: eventChild.color,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          if (eventChild.error)
            SvgPicture.asset(Assets.images.svg.redCross)
          else if (eventChild.isCompleted)
            SvgPicture.asset(Assets.images.svg.blueMark)
          else
            SvgPicture.asset(Assets.images.svg.emptyCheckbox),
        ],
      ),
    );
  }
}
