import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/shared/widgets/details_with_header_skleton.dart';
import 'package:nuforce/app/shared/widgets/text_with_bottom_border.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class InvoiceContact extends StatelessWidget {
  const InvoiceContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsWithHeaderSkleton(
      controller: ExpandableController(),
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Contact',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SvgPicture.asset(Assets.images.svg.edit)
        ],
      ),
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWithBottomBorder(
              hint: 'Name',
              type: CustomType.dateTime,
              onTap: () {},
            ),
            8.h.vSpace,
            TextWithBottomBorder(
              hint: 'Phone',
              type: CustomType.dateTime,
              onTap: () {},
            ),
            8.h.vSpace,
            TextWithBottomBorder(
              hint: 'Mail',
              type: CustomType.dateTime,
              onTap: () {},
            ),
            8.h.vSpace,
            TextWithBottomBorder(
              hint: '+ Add Address',
              type: CustomType.dateTime,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
