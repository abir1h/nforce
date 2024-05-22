import 'package:expandable/expandable.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

Widget contentBody() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'Description',
            style: CustomTextStyle.heading4.copyWith(
              color: AppColors.nutralBlack1,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ExpandableText(
            'Pellentesque pharetra fermentum sit cras. Sed volutpat pulvinar est faucibus. Adipiscing volutpat pharetra nunc, Pellentesque pharetra fermentum sit cras. Sed volutpat pulvinar est faucibus. Adipiscing volutpat pharetra nunc',
            expandText: 'Read More',
            collapseText: 'Read Less',
            style: CustomTextStyle.heading5.copyWith(
              color: AppColors.nutralBlack1,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 3,
            linkColor: AppColors.primaryBlue1,
          ),
          const SizedBox(height: 24),
          Text(
            'FAQ',
            style: CustomTextStyle.heading4.copyWith(
              color: AppColors.nutralBlack1,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    crossFadePoint: 0,
                    hasIcon: false,
                    iconColor: AppColors.nutralBlack1,
                    iconPadding: EdgeInsets.only(right: 16),
                    animationDuration: Duration(milliseconds: 200),
                    expandIcon: Icons.keyboard_arrow_down,
                    collapseIcon: Icons.keyboard_arrow_up,
                    tapBodyToCollapse: true,
                    tapBodyToExpand: true,
                    tapHeaderToExpand: true,
                    iconRotationAngle: 0,
                    alignment: Alignment.topLeft,
                  ),
                  header: Text(
                    'How the price include cleaning?',
                    style: CustomTextStyle.heading5.copyWith(
                      color: AppColors.nutralBlack1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  collapsed: const SizedBox(),
                  expanded: Text(
                    'Egestas placerat et nec sed. Amet at tellus nisl risus. Sit purus enim feugiat suspendisse morbi duis. Amet vitae ultrices eget nec.',
                    style: TextStyle(
                      color: AppColors.subText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Specification',
            style: CustomTextStyle.heading4.copyWith(
              color: AppColors.nutralBlack1,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Text(
                '${index + 1}. Only Service Charge',
                style: CustomTextStyle.heading5.copyWith(
                  color: AppColors.nutralBlack1,
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            'What’s Included?',
            style: CustomTextStyle.heading4.copyWith(
              color: AppColors.nutralBlack1,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                'Only Service Charge',
                style: CustomTextStyle.heading5.copyWith(
                  color: AppColors.nutralBlack1,
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Terms of Service',
            style: CustomTextStyle.heading4.copyWith(
              color: AppColors.nutralBlack1,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                'Your happiness is our goal. Lorem Ipsum is sim ply dummy text of.',
                style: CustomTextStyle.heading5.copyWith(
                  color: AppColors.nutralBlack1,
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Requirement For Service',
            style: CustomTextStyle.heading4.copyWith(
              color: AppColors.nutralBlack1,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                'A recent audit conducted by the safeguar ding boards highlighted.',
                style: CustomTextStyle.heading5.copyWith(
                  color: AppColors.nutralBlack1,
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            'SEO',
            style: CustomTextStyle.heading4.copyWith(
              color: AppColors.nutralBlack1,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            children: [
              for (int i = 0; i < 3; i++)
                Container(
                  margin: const EdgeInsets.only(right: 8, bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.inactiveTabbarColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Insultation',
                    style: CustomTextStyle.heading5.copyWith(
                      color: AppColors.nutralBlack1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    ),
  );
}
