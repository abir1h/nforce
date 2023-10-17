import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/service_items/widgets/landing_page_url_text_box.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_with_switch.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/utils/colors.dart';

Widget settingsBody({
  required bool isLandingPageUrlSelected,
  required bool isShareSelected,
  required bool isCommissionSelected,
  required Function(bool) onLandingSwitchChanged,
  required Function(bool) onShareSwitchChanged,
  required Function(bool) onCommissionSwitchChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 23),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Landing Page URL',
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 32.sp,
              height: 18.sp,
              child: FittedBox(
                child: CupertinoSwitch(
                  applyTheme: true,
                  value: isLandingPageUrlSelected,
                  onChanged: onLandingSwitchChanged,
                  activeColor: AppColors.primaryBlue1,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        LandingPageUrlTextBox(
          controller: TextEditingController(),
        ),
        const SizedBox(height: 23),
        TitleWithSwitch(
          text: 'Share',
          isSwitchSelected: isShareSelected,
          onSwitchChanged: onShareSwitchChanged,
        ),
        const SizedBox(height: 23),
        TitleWithSwitch(
          text: 'Commission Tier',
          isSwitchSelected: isCommissionSelected,
          onSwitchChanged: onCommissionSwitchChanged,
        ),
        const SizedBox(height: 23),
        Text(
          'Regions',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        CustomDropdownButton(
          items: const [
            DropdownMenuItem(
              value: 'X',
              child: Text(
                'X',
              ),
            ),
            DropdownMenuItem(
              value: 'Y',
              child: Text(
                'Y',
              ),
            ),
            DropdownMenuItem(
              value: 'Z',
              child: Text(
                'Z',
              ),
            ),
          ],
          hint: 'Select one',
          onChanged: (newVal) {},
          value: null,
        ),
        const SizedBox(height: 23),
        Text(
          'Preferred Agents',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        CustomDropdownButton(
          items: const [
            DropdownMenuItem(
              value: 'X',
              child: Text(
                'X',
              ),
            ),
            DropdownMenuItem(
              value: 'Y',
              child: Text(
                'Y',
              ),
            ),
            DropdownMenuItem(
              value: 'Z',
              child: Text(
                'Z',
              ),
            ),
          ],
          hint: 'Select one',
          onChanged: (newVal) {},
          value: null,
        ),
      ],
    ),
  );
}
