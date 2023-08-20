import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
class OrXWith extends StatelessWidget {
  const OrXWith({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.inactiveColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(label),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.inactiveColor,
          ),
        ),
      ],
    );
  }
}
