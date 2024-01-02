import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/views/coupon/create_or_edit_coupon_view.dart';
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
  List<CouponDataModel> dummyCouponData = <CouponDataModel>[
    CouponDataModel(
      offerValue: '16%',
      expireDate: '26 June, 2023',
      offerTitleText: 'Pest Control Offer',
      offerDetailsText: r'Spend over $150 and get 16% off on all services (Excludes shipping cost)',
      backgroundColor: AppColors.powderPink,
      offerValueColor: AppColors.red,
    ),
    CouponDataModel(
      offerValue: r'$60',
      expireDate: '30 June, 2023',
      offerTitleText: 'Raccoon Remocal Offer',
      offerDetailsText: r'Spend over $150 and get 16% off on all services (Excludes shipping cost)',
      backgroundColor: AppColors.green2,
      offerValueColor: AppColors.primaryBlue1,
    ),
    CouponDataModel(
      offerValue: '16%',
      expireDate: '30 June, 2023',
      offerTitleText: 'Winter Package',
      offerDetailsText: r'Spend over $150 and get 16% off on all services (Excludes shipping cost)',
      backgroundColor: AppColors.blue2,
      offerValueColor: AppColors.blue,
    ),
  ];

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
                  onDeleteTap: () {
                    setState(() {
                      dummyCouponData.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Coupon deleted successfully'),
                      ),
                    );
                  },
                  onEditTap: () {
                    Get.to<void>(
                      () => CreateOrEditCouponView(
                        isEditing: true,
                        couponDataModel: dummyCouponData[index],
                        onButtonTap: () {},
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
