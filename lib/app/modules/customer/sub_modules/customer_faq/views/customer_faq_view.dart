import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import '../controllers/customer_faq_controller.dart';

class CustomerFaqView extends GetView<CustomerFaqController> {
  const CustomerFaqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerFaqController());
    List<bool> isExpandedList = [];
    return Scaffold(
        appBar: const CustomAppbarMinimal(
          title: "FAQs",
          centerTitle: true,
        ),
        body: GetBuilder<CustomerFaqController>(builder: (_) {
          isExpandedList =
              List.generate(controller.faqList.length, (index) => false);
          return ListView.builder(
            itemCount: controller.faqList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ExpansionTile(
                onExpansionChanged: (isExpanded) {},
                trailing: SizedBox(),
                initiallyExpanded: isExpandedList[index],
                title: Row(
                  children: [
                    Icon(
                      isExpandedList[index]
                          ? Icons.keyboard_arrow_down_outlined
                          : Icons.keyboard_arrow_up_outlined,
                    ),
                    SizedBox(
                      width: 8.h,
                    ),
                    Text(
                      controller.faqList[index].qustion!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 20.w,
                    ),
                    child: Text(
                      controller.faqList[index].answer!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }));
  }
}
