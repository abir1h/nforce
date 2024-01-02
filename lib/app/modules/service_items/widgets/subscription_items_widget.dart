import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/views/subscription/subscription_tile_details_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/subscription_list_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/searchbox_with_leading_icon.dart';
import 'package:nuforce/app/utils/colors.dart';

class SubscriptionItems extends StatefulWidget {
  const SubscriptionItems({super.key});

  @override
  State<SubscriptionItems> createState() => _SubscriptionItemsState();
}

class _SubscriptionItemsState extends State<SubscriptionItems> {
  String? categoryDropdownValue;
  List<String> categoryDropdownItems = ['Category 1', 'Category 2', 'Category 3'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdownButton(
          items: categoryDropdownItems.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: TextStyle(
                  color: AppColors.subText,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          hint: 'Select Category',
          onChanged: (v) {
            setState(() {
              categoryDropdownValue = v as String?;
            });
          },
          value: categoryDropdownValue,
        ),
        SizedBox(height: 14.h),
        const SearchBoxWithLeadingIcon(
          hintText: 'Find by Name...',
          controller: null,
        ),
        SizedBox(height: 24.h),
        Text(
          'Subscription list',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.sp),
                child: GestureDetector(
                  onTap: () {
                    Get.to<void>(() => const SubscriptionTileDetailsView());
                  },
                  child: const SubscriptionListTile(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
