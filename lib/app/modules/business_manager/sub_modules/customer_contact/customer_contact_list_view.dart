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
  final controller = Get.put(CustomerContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: CustomAppbarMinimal(
        title: 'Customer Contacts',
        trailing: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () {
                controller.reset();
                Get.to<void>(const CustomerContactAddView());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 24.r,
                    color: AppColors.nutralBlack1,
                  ),
                  Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        leadingPressed: () {
          Get.to<void>(const CustomerContactListView());
        },
      ),
      body: GetBuilder<CustomerContactController>(
        builder: (_) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
            child: Column(
              children: [
                const CustomSearchWidget(),
                SizedBox(
                  height: 24.h,
                ),
                ListView.builder(
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        //controller.populateFieldsFromModel(controller.customerList[index]);
                        Get.to<void>(
                          CustomerContactDetailsView(
                            mainModel: controller.customerList[index],
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          ListCard(
                            mainModel: controller.customerList[index],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.customerList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
