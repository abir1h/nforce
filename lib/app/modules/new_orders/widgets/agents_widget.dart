import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/colored_button.dart';
import 'package:nuforce/app/utils/colors.dart';

class Agents extends StatelessWidget {
  const Agents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ColoredButton(
      text: '+ Add Agents',
      textColor: AppColors.primaryBlue1,
    );
  }
}
