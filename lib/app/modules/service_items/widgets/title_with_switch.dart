import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class TitleWithSwitch extends StatelessWidget {
  const TitleWithSwitch({
    super.key,
    required this.text,
    required this.isSwitchSelected,
    required this.onSwitchChanged,
  });
  final String text;
  final bool isSwitchSelected;
  final Function(bool) onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.inactiveTabbarColor,
        border: Border.all(
          color: AppColors.inactiveColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 18.sp,
            width: 32.sp,
            child: FittedBox(
              child: CupertinoSwitch(
                applyTheme: true,
                value: isSwitchSelected,
                onChanged: onSwitchChanged,
                activeColor: AppColors.primaryBlue1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
