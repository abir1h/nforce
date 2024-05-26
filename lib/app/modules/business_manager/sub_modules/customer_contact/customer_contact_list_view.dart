import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/customer_contact_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_add_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/widgets/custom_search_widget.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/widgets/list_card.dart';

import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

class CustomerContactListView extends StatefulWidget {
  const CustomerContactListView({super.key});

  @override
  State<CustomerContactListView> createState() => _CustomerContactListViewState();
}

class _CustomerContactListViewState extends State<CustomerContactListView> {
  final controller = Get.find<CustomerContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: CustomAppbarMinimal(
        title: 'Customer Contacts',
        trailing: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  controller.reset();
                  Get.to<void>(() => const CustomerContactAddView());
                },
                child: Text(
                  '+ Add',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.nutralBlack1,
                  ),
                ),
              ),
            ),
          ),
        ],
        leadingPressed: Get.back<void>,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
        child: Column(
          children: [
            const CustomSearchWidget(),
            SizedBox(height: 24.h),
            GetBuilder<CustomerContactController>(
              builder: (controller) {
                if (controller.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: controller.customers?.data?.length ?? 0,
                  itemBuilder: (_, index) {
                    final customer = controller.customers!.data![index];
                    return GestureDetector(
                      onTap: () {
                        Get.to<void>(
                          () => CustomerContactDetailsView(customer: customer),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListCard(customer: customer),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
