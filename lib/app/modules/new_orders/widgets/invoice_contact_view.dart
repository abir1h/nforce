import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/shared/widgets/details_with_header_skleton.dart';
import 'package:nuforce/app/shared/widgets/full_screen_map.dart';
import 'package:nuforce/app/shared/widgets/text_with_bottom_border.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class InvoiceContactView extends StatelessWidget {
  const InvoiceContactView({
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
        child: GetBuilder<InvoiceController>(
          builder: (controller) {
            final contact = controller.invoice?.billingAddress;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWithBottomBorder(
                  hint: contact?.name ?? '-',
                  type: CustomType.dateTime,
                  onTap: () {},
                ),
                8.h.vSpace,
                TextWithBottomBorder(
                  hint: contact?.mobile ?? '-',
                  type: CustomType.dateTime,
                  onTap: () {},
                ),
                8.h.vSpace,
                TextWithBottomBorder(
                  hint: contact?.email ?? '-',
                  type: CustomType.dateTime,
                  onTap: () {},
                ),
                8.h.vSpace,
                TextWithBottomBorder(
                  hint: '+ Add Address',
                  type: CustomType.dateTime,
                  onTap: () {
                    Get.to(() => const FullScreenMap());
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
