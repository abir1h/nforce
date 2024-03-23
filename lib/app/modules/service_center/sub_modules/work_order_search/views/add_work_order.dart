import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order_search/controllers/add_work_order_controller.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../shared/widgets/custom_dropdown.dart';
import '../../../../../shared/widgets/custom_text_field.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/text_styles.dart';
import '../../../../home/components/colored_checkbox_with_title.dart';

class AddWorkOrder extends StatefulWidget {
  const AddWorkOrder({super.key});

  @override
  State<AddWorkOrder> createState() => _AddWorkOrderState();
}

class _AddWorkOrderState extends State<AddWorkOrder> {
  final controller = Get.put(AddWorkOrderController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
         return true;
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.bgWithOpacity,
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppbarMinimal(
          title: 'Add Estimation/Work Order',
        ),
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed:(){},
                      text: 'Reset',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: PrimaryButton(
                      onPressed:()=> Get.toNamed(Routes.WORK_ORDER_SEARCH),
                      text: 'Add',
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Service Region*",
                style: CustomTextStyle.paragraphSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.nutralBlack1,
                  // fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: () {
                  controller.showSearchableDialog(context, controller.items,
                      (selectedItem) {
                    setState(() {
                      controller.selectedRegion = selectedItem;
                    });
                  });
                },
                child: Container(
                  width: 1.sw,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: Colors.white,
                      border: Border.all(color: AppColors.greyStrokColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.selectedRegion ?? "Select One",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.nutralBlack2),
                      ),
                      SvgPicture.asset(Assets.images.svg.downArrow)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Find Contact*",
                style: CustomTextStyle.paragraphSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.nutralBlack1,
                  // fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: () {
                  controller.showSearchableDialog(
                      context, controller.itemsContact, (selectedItem) {
                    setState(() {
                      controller.selectedContact = selectedItem;
                    });
                  });
                },
                child: Container(
                  width: 1.sw,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: Colors.white,
                      border: Border.all(color: AppColors.greyStrokColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.selectedContact ?? "Select One",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.nutralBlack2),
                      ),
                      SvgPicture.asset(Assets.images.svg.downArrow)
                    ],
                  ),
                ),
              ),
              Text('Search customer contact by name',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,color:AppColors.nutralBlack2 ),),SizedBox(
                height: 16.h,
              ),
              Text(
                "Service Package",
                style: CustomTextStyle.paragraphSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.nutralBlack1,
                  // fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: () {
                  controller.showSearchableDialog(
                      context, controller.itemsPackage, (selectedItem) {
                    setState(() {
                      controller.selectedPackage = selectedItem;
                    });
                  });
                },
                child: Container(
                  width: 1.sw,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: Colors.white,
                      border: Border.all(color: AppColors.greyStrokColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.selectedPackage ?? "Select One",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.nutralBlack2),
                      ),
                      SvgPicture.asset(Assets.images.svg.downArrow)
                    ],
                  ),
                ),
              ),
              Text('Service package to copy line items for estimation (Optional)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,color:AppColors.nutralBlack2 ),),
              SizedBox(height: 16.h,),
              ColoredCheckboxWithTitle(
                color: AppColors.primaryBlue1,
                isSelected: true,
                onChanged: (p0) {},
                title: 'Create invoice',
                titleColor: AppColors.nutralBlack1,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
