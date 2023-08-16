import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
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
        height: 72,
        width: 72,
        child: Center(
          child: Stack(
            children: [
              CircularPercentIndicator(
                radius: 36,
                lineWidth: 10,
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
                      height: 62,
                      width: 62,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 56,
                      width: 56,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryBlue1,
                      ),
                      child: Text(
                        text,
                        style: CustomTextStyle.heading4.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
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
