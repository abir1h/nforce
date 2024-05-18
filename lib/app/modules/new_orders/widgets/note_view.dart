import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/views/add_note_view.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:nuforce/app/modules/new_orders/models/activity_log_model.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../shared/widgets/details_with_header_skleton.dart';
import '../controllers/invoice_controller.dart';
import 'dot_widget.dart';

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
  final invoiceController=Get.put(InvoiceController());
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
              Get.to<void>(() => const AddNoteView(),arguments: invoiceController.invoice);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Notes',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp,fontFamily: "Poppins",color: AppColors.nutralBlack1),),
              SizedBox(height: 8.h,),
              ListView.separated(
                itemCount: controller.noteList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.noteList[index].note!,
                        style: TextStyle(
                          color: AppColors.nutralBlack2,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,fontFamily: 'Poppins'
                        ),
                      ),SizedBox(height:8.h),
                      DotWidget(
                        dashColor:AppColors.greyText,
                        dashHeight: 1.h,
                        dashWidth: 6.w,
                      ),

                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return  SizedBox(height: 10.h,);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}


