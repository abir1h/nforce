import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuforce/app/utils/colors.dart';

class SvgButton extends StatelessWidget {
  const SvgButton({
    super.key,
    required this.svgPath,
    required this.onPressed,
  });

  final String svgPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.greyText,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 26),
        child: SvgPicture.asset(
          svgPath,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
