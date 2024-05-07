import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class AddressWithStaticMap extends StatefulWidget {
  const AddressWithStaticMap({
    super.key,
  });

  @override
  State<AddressWithStaticMap> createState() => _AddressWithStaticMapState();
}

class _AddressWithStaticMapState extends State<AddressWithStaticMap> {
  List<PopupMenuEntry<int>> popupMenuItems = [
    PopupMenuItem<int>(
      value: 1,
      child: Text(
        'Remove',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.bgWithOpacity,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 141.h,
                decoration: BoxDecoration(
                  color: AppColors.white1,
                  borderRadius: BorderRadius.circular(16.r),
                  // image: DecorationImage(
                  //   image: NetworkImage(),
                  // ),
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                      color: AppColors.greyStrokColor,
                    ),
                  ),
                  child: Text(
                    'Billing',
                    style: TextStyle(
                      color: AppColors.nutralBlack2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          10.h.vSpace,
          Row(
            children: [
              Expanded(
                child: Text(
                  '12 Lafayetter Ave, Ossining, NY 10562, USA',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => popupMenuItems,
                onSelected: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
