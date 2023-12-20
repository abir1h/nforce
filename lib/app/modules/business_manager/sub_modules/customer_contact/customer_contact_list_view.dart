import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/customer_contact_controller.dart';
import 'customer_contact_add_view.dart';
import 'customer_contact_details_view.dart';
import 'widgets/custom_search_widget.dart';
import 'widgets/list_card.dart';

import '../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../utils/colors.dart';
import '../../views/business_manager_preferences_view.dart';

class CustomerContactListView extends StatefulWidget {
  const CustomerContactListView({super.key});

  @override
  State<CustomerContactListView> createState() =>
      _CustomerContactListViewState();
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
                Get.to(const CustomerContactAddView());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 24.r,
                    color: AppColors.nutralBlack1,
                  ),
                  Text(
                    "Add",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontSize: 14.sp,
                        color: AppColors.nutralBlack1),
                  )
                ],
              ),
            ),
          )
        ],
        leadingPressed: () {
          Get.to(const CustomerContactListView());
        },
      ),
      body: GetBuilder<CustomerContactController>(builder: (_) {
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
                    onTap: (){
                      //controller.populateFieldsFromModel(controller.customerList[index]);
                      Get.to(CustomerContactDetailsView(mainModel:  controller.customerList[index],));
                    },
                    child: Column(
                      children: [
                        ListCard(
                          mainModel: controller.customerList[index],
                        ),SizedBox(height: 16.h,)
                      ],
                    ),
                  );
                },
                itemCount: controller.customerList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              )
            ],
          ),
        );
      }),
    );
  }
}
