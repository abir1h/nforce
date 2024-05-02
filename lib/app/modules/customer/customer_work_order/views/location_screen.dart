import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuforce/app/modules/settings/widgets/expanded_list.dart';
import 'package:nuforce/gen/assets.gen.dart';
import '../../../../shared/widgets/custom_dropdown.dart';
import '../../../../utils/text_styles.dart';
import '../../../service_center/sub_modules/work_order_view/sub_modules/over_view/views/edit_work_order.dart';

import '../../../../utils/app_sizes.dart';
import '../../../../utils/colors.dart';
import '../../widgets/view_map_bottomsheet.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    super.key,
  });
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Address",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "poppins",
                      color: AppColors.nutralBlack1),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Expanded(
                child: CustomDropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: 'X',
                      child: Text(
                        'All',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Y',
                      child: Text(
                        'Service',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Z',
                      child: Text(
                        'Billing',
                      ),
                    ),
                  ],
                  hint: 'All',
                  onChanged: (newVal) {},
                  value: null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          LocationCard(),SizedBox(height: 16.h,),  LocationCard(),SizedBox(height: 16.h,),  LocationCard(),SizedBox(height: 16.h,),  LocationCard(),SizedBox(height: 32.h,),
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>showCupertinoModalPopup<void>(
        context: context,
        builder: (context) => const ViewMapBottomSheet(),
      ),
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.greyStrokColor, width: 1.w)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  Assets.images.png.mapImage2.keyName,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "12 Lafayetter Ave, Ossining, NY 10562, USA",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: "poppins",
                        color: AppColors.nutralBlack1),
                  ),
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (context) => popupMenuItems,
                  onSelected: (value) {},
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Contractor",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: "poppins",
                  color: AppColors.nutralBlack2),
            ),
            Text(
              "taylor333@gmail.com",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  fontFamily: "poppins",
                  color: AppColors.nutralBlack2),
            ),
            Text(
              "+6316056575",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  fontFamily: "poppins",
                  color: AppColors.nutralBlack2),
            ),
          ],
        ),
      ),
    );
  }

  List<PopupMenuEntry<int>> popupMenuItems = [
    PopupMenuItem<int>(
      value: 1,
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.images.svg.editIc,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            'Edit',
            style: CustomTextStyle.paragraphExtraSmall.copyWith(
              color: AppColors.subText,
            ),
          ),
        ],
      ),
    ),
    PopupMenuItem<int>(
      value: 2,
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.images.svg.delete,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            'Delete',
            style: CustomTextStyle.paragraphExtraSmall.copyWith(
              color: AppColors.subText,
            ),
          ),
        ],
      ),
    ),
  ];
}
