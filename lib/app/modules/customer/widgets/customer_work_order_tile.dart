import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/providers/work_order_provider.dart';
import 'package:nuforce/app/utils/colors.dart';

class CustomerWorkOrderTile extends StatelessWidget {
  const CustomerWorkOrderTile({
    required this.order,
    super.key,
  });
  final MockWorkOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.nutralBlack2.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  order.contactName,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '\$${order.total}',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_pin),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  order.address,
                  style: TextStyle(
                    color: AppColors.subText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Agent Name',
                    style: TextStyle(
                      color: AppColors.subText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Jerome Bell',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                height: 24,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: ShapeDecoration(
                  color: AppColors.deepYellow,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: Text(
                  'Pending',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
