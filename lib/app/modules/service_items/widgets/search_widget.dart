import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.greyText,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: AppColors.greyText,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SvgPicture.asset(Assets.images.svg.search),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const Wrap(
                      children: [
                        FilterBottomSheet(),
                      ],
                    );
                  },
                );
              },
              child: SvgPicture.asset(
                Assets.images.svg.filter,
              ),
            ),
            SizedBox(width: 16.sp),
          ],
        ),
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  double sliderStartValue = 75;
  double sliderEndValue = 275;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      decoration: const BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              color: AppColors.greyText,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColors.greyText,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search in name...',
                      hintStyle: TextStyle(
                        color: AppColors.greyText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SvgPicture.asset(Assets.images.svg.search),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Type',
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
                value: 'All',
                child: Text('All'),
              ),
              DropdownMenuItem(
                value: 'Type 1',
                child: Text('Type 1'),
              ),
              DropdownMenuItem(
                value: 'Type 2',
                child: Text('Type 2'),
              ),
            ],
            hint: 'Select one',
            onChanged: (v) {},
            value: null,
          ),
          const SizedBox(height: 20),
          Text(
            'Catelog',
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
                value: 'All',
                child: Text('All'),
              ),
              DropdownMenuItem(
                value: 'Catelog 1',
                child: Text('Catelog 1'),
              ),
              DropdownMenuItem(
                value: 'Catelog 2',
                child: Text('Catelog 2'),
              ),
            ],
            hint: 'Select one',
            onChanged: (v) {},
            value: null,
          ),
          const SizedBox(height: 20),
          Text(
            'Price Range',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          SfRangeSlider(
            min: 0,
            max: 300.0,
            values: SfRangeValues(sliderStartValue, sliderEndValue),
            interval: 20,
            showTicks: true,
            enableTooltip: true,
            shouldAlwaysShowTooltip: true,
            minorTicksPerInterval: 1,
            startThumbIcon: SvgPicture.asset(Assets.images.svg.thumb),
            endThumbIcon: SvgPicture.asset(Assets.images.svg.thumb),
            activeColor: AppColors.primaryBlue1,
            tooltipTextFormatterCallback: (dynamic actualValue, String formattedText) {
              return '\$${actualValue.toStringAsFixed(0)}';
            },
            onChanged: (SfRangeValues values) {
              setState(() {
                sliderStartValue = values.start as double;
                sliderEndValue = values.end as double;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Price Range',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SecondaryButton(
                  onPressed: Get.back<void>,
                  text: 'Reset',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PrimaryButton(
                  onPressed: Get.back<void>,
                  text: 'Apply',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
