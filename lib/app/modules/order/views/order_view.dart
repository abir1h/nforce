import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/order/views/create_order.dart';
import 'package:nuforce/app/modules/order/views/order_details_view.dart';
import 'package:nuforce/app/modules/order/widgets/order_status.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/main.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'Orders',
        showBackButton: false,
        trailing: [
          TextButton(
            onPressed: () {
              Get.to(const CreateOrderView());
            },
            child: Text(
              '+ Create',
              style: TextStyle(
                color: AppColors.primaryBlue1,
                fontSize: isIpad ? 10.sp : 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          5.w.hSpace,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: OrderCard(
                onTap: () {
                  Get.to(() => const OrderDetailsView());
                },
                orderStatus: index % 4 == 0
                    ? OrderStatus.pending
                    : index % 4 == 1
                        ? OrderStatus.completed
                        : index % 4 == 2
                            ? OrderStatus.active
                            : OrderStatus.cancelled,
              ),
            );
          },
        ),
      ).ifIpad,
    );
  }
}
