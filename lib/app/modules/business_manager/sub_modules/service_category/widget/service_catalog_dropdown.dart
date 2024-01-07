import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown_with_bg.dart';
import 'package:nuforce/app/utils/colors.dart';

class ServiceCalatogDropdown extends StatefulWidget {
  const ServiceCalatogDropdown({
    super.key,
  });

  @override
  State<ServiceCalatogDropdown> createState() => _ServiceCalatogDropdownState();
}

class _ServiceCalatogDropdownState extends State<ServiceCalatogDropdown> {
  List<String> dropdownItems = ['Type 1', 'Type 2', 'Type 3'];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'All Catalogs',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Expanded(
          child: CustomDropdownButtonWithBG(
            items: dropdownItems.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBlue1,
                  ),
                ),
              );
            }).toList(),
            hint: 'Select one',
            onChanged: (val) {
              setState(() {
                selectedValue = val as String?;
              });
            },
            value: selectedValue,
          ),
        ),
      ],
    );
  }
}
