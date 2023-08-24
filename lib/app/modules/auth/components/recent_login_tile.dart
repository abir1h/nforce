import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class RecentLoginTile extends StatelessWidget {
  const RecentLoginTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.white3,
              ),
              child: const Center(
                child: Icon(Icons.person, color: AppColors.white1),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WildLife Express LLC',
                  style: CustomTextStyle.heading4.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.nutralBlack1,
                  ),
                ),
                Text(
                  'Last logged in 12 hours ago',
                  style: CustomTextStyle.paragraphExtraSmall.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.subText,
                  ),
                ),
              ],
            ),
          ],
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) => popupMenuItems,
          onSelected: (value) {
            log(value.toString(), name: 'RecentLoginTile');
          },
        )
      ],
    );
  }
}

List<PopupMenuEntry<int>> popupMenuItems = [
  PopupMenuItem<int>(
    value: 1,
    child: Text(
      'Remove Account',
      style: CustomTextStyle.paragraphExtraSmall.copyWith(
        color: AppColors.subText,
      ),
    ),
  ),
  PopupMenuItem<int>(
    value: 2,
    child: Text(
      'Remove Password',
      style: CustomTextStyle.paragraphExtraSmall.copyWith(
        color: AppColors.subText,
      ),
    ),
  ),
];
