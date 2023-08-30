import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/home/components/number_text_amount_matrix.dart';
import 'package:nuforce/app/modules/home/components/task_tile_with_checkbox.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
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
                  Container(height: 1, width: width, color: AppColors.inactiveColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: SizedBox(
                      width: width - 32 - 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(Assets.images.png.profilePlaceholderMale.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TaskTileWithCheckbox(),
                                const SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    '+ Show more',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.subText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
