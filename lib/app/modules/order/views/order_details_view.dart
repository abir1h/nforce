import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/order/controllers/order_controller.dart';
import 'package:nuforce/app/modules/order/widgets/order_mini_tab.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  void initState() {
    super.initState();
    Get.put(OrderController());
  }

  @override
  void dispose() {
    Get.delete<OrderController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white1,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.nutralBlack1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Eleanor Pena',
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '25 Aug, 2023',
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          _editButton(onTap: () {}),
        ],
      ),
      body: Column(
        children: [
          10.h.vSpace,
          const OrderMiniTabs(),
        ],
      ),
    );
  }

  Padding _editButton({required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.primaryBlue1.withOpacity(0.1),
          ),
          child: Row(
            children: [
              SvgPicture.asset(Assets.images.svg.edit),
              3.w.hSpace,
              Text(
                'Edit',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: AppColors.primaryBlue1,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
