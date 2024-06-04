import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/customer_contact_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_add_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/widgets/custom_search_widget.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/widgets/list_card.dart';

import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../../gen/assets.gen.dart';

class CustomerContactListView extends StatefulWidget {
  const CustomerContactListView({super.key});

  @override
  State<CustomerContactListView> createState() => _CustomerContactListViewState();
}

class _CustomerContactListViewState extends State<CustomerContactListView> {
  // final controller = Get.find<CustomerContactController>();
  final controller = Get.put(CustomerContactController());

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
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.greyText,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      onChanged: (v){
                        controller.getCustomers(query: v.trim());
                      },
                      decoration: InputDecoration(
                        hintText: 'find contact by name, notes, etc.',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: SvgPicture.asset(
                            Assets.images.svg.search,
                            height: 18.h,
                            fit: BoxFit.contain,
                            width: 18.h,
                            colorFilter: const ColorFilter.mode(AppColors.greyText, BlendMode.srcIn),
                          ),
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.primaryBlue1,
                  ),
                  child: SvgPicture.asset(Assets.images.svg.filter2),
                ),
              ],
            ),
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
                        controller.getContactDetails('${customer.id}');
                        Get.to<void>(() => const CustomerContactDetailsView());
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
