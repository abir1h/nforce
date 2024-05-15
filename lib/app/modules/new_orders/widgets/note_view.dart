import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/views/add_note_view.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:expandable/expandable.dart';
import '../../../shared/widgets/details_with_header_skleton.dart';
import '../controllers/invoice_controller.dart';

class NoteView extends StatefulWidget {
  const NoteView({
    super.key,
  });

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  void initState() {
    super.initState();
    activityExpandableController.addListener(() {
      if (activityExpandableController.expanded) {
        setState(() {
          isActivityLogExpanded = true;
        });
      } else {
        setState(() {
          isActivityLogExpanded = false;
        });
      }
    });
  }

  final activityExpandableController = ExpandableController();
  bool isActivityLogExpanded = false;
  @override
  Widget build(BuildContext context) {
    return DetailsWithHeaderSkleton(
      controller: ExpandableController(),
      header: Row(
        children: [
          Text(
            'Add Note',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Get.to<void>(() => const AddNoteView());
            },
            child: Text(
              '+ Add Note',
              style: TextStyle(
                color: AppColors.primaryBlue1,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          10.w.hSpace,
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic_none_outlined),
          ),
        ],
      ),
      body: GetBuilder<InvoiceController>(
        builder: (controller) {
          return Column(
            children: [],
          );
        },
      ),
    );
  }
}
