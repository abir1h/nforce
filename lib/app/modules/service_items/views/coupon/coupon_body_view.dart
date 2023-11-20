import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/service_items/widgets/coupon_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/oval_button.dart';
import 'package:nuforce/app/modules/service_items/widgets/textbox_with_button_inside.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class CouponBody extends StatefulWidget {
  const CouponBody({
    super.key,
  });

  @override
  State<CouponBody> createState() => _CouponBodyState();
}

class _CouponBodyState extends State<CouponBody> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextboxWithButtonInside(
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            OvalButton(
              isSelected: isAvailable,
              onTap: () {
                setState(() {
                  isAvailable = true;
                });
              },
              text: 'Available',
            ),
            const SizedBox(width: 12),
            OvalButton(
              isSelected: !isAvailable,
              onTap: () {
                setState(() {
                  isAvailable = false;
                });
              },
              text: 'Not-Available',
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: width,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: AppColors.white3,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: dummyCouponData.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CouponWidget(
                  coupon: dummyCouponData[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
