import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/modules/service_items/widgets/edit_faq_bottomsheet_widget.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class FaqTile extends StatefulWidget {
  const FaqTile({
    super.key,
  });

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.white3,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                crossFadePoint: 0,
                // hasIcon: false,
                iconColor: AppColors.nutralBlack1,
                iconSize: 24,
                iconPadding: EdgeInsets.only(right: 16),
                animationDuration: Duration(milliseconds: 300),
                expandIcon: Icons.keyboard_arrow_down,
                collapseIcon: Icons.keyboard_arrow_up,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
                tapHeaderToExpand: true,
                iconRotationAngle: 0,
                alignment: Alignment.topLeft,
                iconPlacement: ExpandablePanelIconPlacement.left,
              ),
              header: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'How the price include cleaning?',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              collapsed: const SizedBox(),
              expanded: Text(
                'Egestas placerat et nec sed. Amet at tellus nisl risus. Sit purus enim feugiat suspendie morbi duis. Amet vitae ',
                style: TextStyle(
                  color: AppColors.nutralBlack2,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return EditFaqBottomSheetWidget(
                    question: 'How the price include cleaning?',
                    answer: 'Egestas placerat et nec sed. Amet at tellus nisl risus. Sit purus enim feugiat suspendie morbi duis. Amet vitae ',
                    answerController: answerController,
                    questionController: questionController,
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: SvgPicture.asset(Assets.images.svg.pencil),
            ),
          ),
        ],
      ),
    );
  }
}
