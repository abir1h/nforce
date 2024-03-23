import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/settings/sub_modules/route_suggestions/widgets/location_card.dart';

import '../../../../../utils/colors.dart';

class PropertiesTabView extends StatefulWidget {
  const PropertiesTabView({Key? key});

  @override
  State<PropertiesTabView> createState() => _PropertiesTabViewState();
}

class _PropertiesTabViewState extends State<PropertiesTabView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Text(
            "Total Properties 5",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              fontFamily: "Poppins",
              color: AppColors.nutralBlack1,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            color: Colors.red,
            child: ListView.separated(
              itemBuilder: (_, index) {
                return  LocationCard();
              },
              shrinkWrap: true,
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, index) {
                return SizedBox(height: 8.h);
              },
            ),
          ),
        ],
      ),
    );
  }
}
