import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';

class PerformanceCardWidget extends StatelessWidget {
  const PerformanceCardWidget({
    super.key,
    required this.mainPercentage,
    required this.subPercentage,
    required this.title,
    required this.color,
  });

  final String mainPercentage;
  final String subPercentage;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyText.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    mainPercentage,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    subPercentage,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
