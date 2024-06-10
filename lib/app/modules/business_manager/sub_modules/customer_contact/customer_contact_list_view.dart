import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/customer_contact_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_add_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/widgets/list_card.dart';

import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

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
                      onChanged: (v) {
                        v.length > 2 ? controller.getCustomers(query: v.trim()) : null;
                        if (v.length == 0) {
                          controller.getCustomers();
                        }
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
                  return const ContactLoader();
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

class ContactLoader extends StatelessWidget {
  const ContactLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, index) {
        return SizedBox(
          height: 16.h,
        );
      },
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 10.w, right: 18.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.white3, width: 1.w),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primaryBlue1,
                          radius: 20.r,
                          child: Text(
                            '',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: .4.sw,
                              height: 12.0,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: .2.sw,
                              height: 12.0,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.nutralBlack2,
                  ),
                ],
              ),
            ));
      },
      itemCount: 10,
      shrinkWrap: true,
    );
  }
}
