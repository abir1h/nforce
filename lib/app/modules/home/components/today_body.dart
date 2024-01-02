import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/number_text_amount_matrix.dart';
import 'package:nuforce/app/modules/home/components/task_tile_with_checkbox.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class TodayBody extends StatelessWidget {
  const TodayBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today’s Appointments',
                  style: TextStyle(
                    fontSize: 16.sp,
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
                      Container(
                        height: 1,
                        width: width,
                        color: AppColors.inactiveColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
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
                                child: ExpandablePanel(
                                  controller: controller.expandableController,
                                  theme: const ExpandableThemeData(
                                    crossFadePoint: 0,
                                    hasIcon: false,
                                    iconColor: AppColors.nutralBlack1,
                                    iconSize: 0,
                                    iconPadding: EdgeInsets.only(right: 16),
                                    animationDuration: Duration(milliseconds: 300),
                                    expandIcon: Icons.keyboard_arrow_down,
                                    collapseIcon: Icons.keyboard_arrow_up,
                                    tapBodyToCollapse: true,
                                    tapBodyToExpand: true,
                                    tapHeaderToExpand: true,
                                    iconRotationAngle: 0,
                                    alignment: Alignment.topLeft,
                                  ),
                                  header: Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: TaskTileWithCheckbox(
                                      mockTaskApi: controller.mockTaskApiList[0],
                                      onChanged: (value) {
                                        controller.updateMockApi(0, value!);
                                      },
                                    ),
                                  ),
                                  collapsed: const SizedBox(),
                                  expanded: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.mockTaskApiList.length - 1,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 12),
                                        child: TaskTileWithCheckbox(
                                          mockTaskApi: controller.mockTaskApiList[index + 1],
                                          onChanged: (value) {
                                            controller.updateMockApi(index + 1, value!);
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 16 + 48 + 24),
                          GestureDetector(
                            onTap: () {
                              controller.expandableController.toggle();
                            },
                            child: Text(
                              controller.isExpanded ? '- Show less' : '+ Show more',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.subText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
