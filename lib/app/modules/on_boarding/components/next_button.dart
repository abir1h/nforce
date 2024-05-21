import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.percent,
    required this.onTap,
    required this.text,
  });

  final double percent;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: isIpad ? 88.h : 72.h,
        width: isIpad ? 88.h : 72.h,
        child: Center(
          child: Stack(
            children: [
              CircularPercentIndicator(
                radius: isIpad ? 43.r : 36.r,
                lineWidth: 10.w,
                animation: true,
                animateFromLastPercent: true,
                percent: percent,
                startAngle: 90,
                backgroundColor: AppColors.white2,
                progressColor: AppColors.primaryBlue1,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: isIpad ? 72.h : 62.h,
                      width: isIpad ? 72.h : 62.h,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: isIpad ? 66.h : 56.h,
                      width: isIpad ? 66.h : 56.h,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryBlue1,
                      ),
                      child: Center(
                        child: Text(
                          text,
                          style: CustomTextStyle.heading4.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
