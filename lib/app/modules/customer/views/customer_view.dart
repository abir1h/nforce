import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/model/user_card_model.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/providers/work_order_provider.dart';
import 'package:nuforce/app/modules/customer/widgets/customer_work_order_tile.dart';
import 'package:nuforce/app/modules/service_items/widgets/search_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown_with_bg.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/global_states.dart';
import 'package:nuforce/main.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  @override
  void initState() {
    super.initState();
    Get.put(AppState()).setUser(
      UserCard(
        displayName: 'Abu Bokkor',
        businessName: '19 Dec, 2023',
        photoUrl: '',
      ),
    );
  }

  final List<String> items = <String>['All', 'Pending', 'Completed', 'Cancelled'];
  String ddValue = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                const SearchWidget(showFilter: false),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    Text(
                      'Work Order List',
                      style: TextStyle(
                        color: AppColors.nutralBlack1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: CustomDropdownButtonWithBG(
                        bgColor: AppColors.textFieldBackground,
                        items: items.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                color: AppColors.nutralBlack1,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        }).toList(),
                        hint: '',
                        onChanged: (v) {
                          setState(() {
                            ddValue = v as String;
                          });
                        },
                        value: ddValue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: WorkOrderProvider.workOrderList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CustomerWorkOrderTile(
                          order: WorkOrderProvider.workOrderList[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
