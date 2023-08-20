import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';
class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 50,
            width: width,
            color: isSelected ? AppColors.tabbarColor : AppColors.inactiveTabbarColor,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? AppColors.primaryBlue1 : AppColors.greyText,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            width: width,
            color: isSelected ? AppColors.primaryBlue1 : AppColors.white3,
          ),
        ],
      ),
    );
  }
}