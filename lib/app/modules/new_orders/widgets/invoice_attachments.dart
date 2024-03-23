import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/settings/sub_modules/addons/widgets/dotted_border.dart';
import 'package:nuforce/app/shared/widgets/details_with_header_skleton.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class InvoiceAttachments extends StatefulWidget {
  const InvoiceAttachments({
    super.key,
  });

  @override
  State<InvoiceAttachments> createState() => _InvoiceAttachmentsState();
}

class _InvoiceAttachmentsState extends State<InvoiceAttachments> {
  @override
  void initState() {
    super.initState();
    attachMentExpandableController.addListener(() {
      if (attachMentExpandableController.expanded) {
        setState(() {
          isAttachmentExpanded = true;
        });
      } else {
        setState(() {
          isAttachmentExpanded = false;
        });
      }
    });
  }

  final attachMentExpandableController = ExpandableController();
  bool isAttachmentExpanded = false;

  @override
  Widget build(BuildContext context) {
    return DetailsWithHeaderSkleton(
      controller: ExpandableController(),
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.attachment, color: AppColors.primaryBlue1),
          5.w.hSpace,
          const Text('Attachments'),
          const Spacer(),
          Icon(isAttachmentExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
        ],
      ),
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: Row(
              children: [
                DottedRect(
                  color: Colors.grey,
                  gap: 5,
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
