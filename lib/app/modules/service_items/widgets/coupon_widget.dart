import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuforce/app/modules/service_items/widgets/oval_button_with_traling_icon.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class CouponDataModel {
  final String offerValue;
  final String expireDate;
  final String offerTitleText;
  final String offerDetailsText;
  final Color backgroundColor;
  final Color offerValueColor;

  CouponDataModel({
    required this.offerValue,
    required this.expireDate,
    required this.offerTitleText,
    required this.offerDetailsText,
    required this.backgroundColor,
    required this.offerValueColor,
  });
}

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    super.key,
    required this.coupon,
    this.onEditTap,
    this.onDeleteTap,
  });
  final CouponDataModel coupon;
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: coupon.backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coupon.offerValue,
                      style: TextStyle(
                        color: coupon.offerValueColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'OFF',
                      style: TextStyle(
                        color: coupon.offerValueColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Expire\n${coupon.expireDate}',
                      style: TextStyle(
                        color: AppColors.subText,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coupon.offerTitleText,
                        style: TextStyle(
                          color: AppColors.nutralBlack1,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        coupon.offerDetailsText,
                        style: TextStyle(
                          color: AppColors.subText,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: width,
            child: SvgPicture.asset(
              Assets.images.svg.ticketRipper,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                OvalButtonWithTralingIcon(
                  text: 'Collect',
                  onTap: () {},
                  icon: Icons.copy,
                ),
                const SizedBox(width: 8),
                OvalButtonWithTralingIcon(
                  text: 'Share with friends',
                  onTap: () {},
                  icon: Icons.share,
                ),
                const Spacer(),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      onTap: onEditTap,
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: AppColors.subText,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: onDeleteTap,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: AppColors.subText,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
