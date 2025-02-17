import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/location_screen.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/policy_screen.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/schedule_screen.dart';
import 'package:nuforce/app/modules/order/controllers/order_controller.dart';
import 'package:nuforce/app/modules/order/views/order_overview.dart';
import 'package:nuforce/app/modules/order/widgets/order_mini_tab.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order_view/sub_modules/invoice/views/invoice_view.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order_view/sub_modules/over_view/views/edit_work_order.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

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
        toolbarHeight: isIpad ? 80.h : null,
        backgroundColor: AppColors.white1,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.nutralBlack1,
            size: isIpad ? 20.h : null,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Eleanor Pena',
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: isIpad ? 14.sp : 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '25 Aug, 2023',
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: isIpad ? 8.sp : 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          _editButton(
            onTap: () {
              Get.to(const EditWorkOrder()); // THIS IS JUST A PLACEHOLDER
            },
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [];
        },
        body: Column(
          children: [
            const OrderMiniTabs(),
            Expanded(
              child: GetBuilder<OrderController>(
                builder: (controller) {
                  switch (controller.tabEnum) {
                    case OrderTabEnum.overview:
                      return const OrderOverview();
                    case OrderTabEnum.invoices:
                      return const InvoiceView(); // TODO Make these UIs
                    case OrderTabEnum.schedules:
                      return const SingleChildScrollView(
                        child: Column(
                          children: [
                            ScheduleScreen(),
                          ],
                        ),
                      );
                    case OrderTabEnum.locations:
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            10.h.vSpace,
                            const LocationScreen(),
                          ],
                        ),
                      );
                    case OrderTabEnum.policies:
                      return Column(
                        children: [
                          10.h.vSpace,
                          const PolicySscreen(),
                        ],
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _editButton({required VoidCallback onTap}) {
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
