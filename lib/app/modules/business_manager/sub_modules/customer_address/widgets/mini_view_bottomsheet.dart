import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/customer_address_view.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

Future<dynamic> miniViewBottomSheet({
  required BuildContext context,
  required List<TitleSubtitle> titleSubtitles,
  required VoidCallback onEdit,
  required VoidCallback onDelete,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (ctx) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'View  Details',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            6.h.vSpace,
            const Divider(
              color: AppColors.nutralBlack1,
              height: 2,
            ),
            6.h.vSpace,
            for (int i = 0; i < titleSubtitles.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      titleSubtitles[i].title,
                      style: TextStyle(
                        color: AppColors.nutralBlack2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      titleSubtitles[i].subtitle,
                      style: TextStyle(
                        color: AppColors.nutralBlack1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // 16.h.vSpace,
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onDelete();
                      },
                      text: 'Delete',
                    ),
                  ),
                  16.w.hSpace,
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onEdit();
                      },
                      text: 'Edit',
                    ),
                  ),
                ],
              ),
            ),
            20.h.vSpace,
          ],
        ),
      );
    },
  );
}
