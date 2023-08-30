import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/home/components/number_text_amount_matrix.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class TodayBody extends StatelessWidget {
  const TodayBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today’s Appointments',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.nutralBlack1,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.inactiveColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MatrixWidget(), // This widget comes with padding

                  Container(height: 1, width: width, color: AppColors.inactiveColor)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
