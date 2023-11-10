import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/service_items/widgets/subscription_list_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
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
        Container(
          decoration: BoxDecoration(
            color: AppColors.textFieldBackground,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Find by Name...',
              hintStyle: TextStyle(
                color: AppColors.subText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.subText,
              ),
            ),
          ),
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
                child: const SubscriptionListTile(),
              );
            },
          ),
        ),
      ],
    );
  }
}
